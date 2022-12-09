// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract BuyMeACoffee {

	// Event to emit when a Memo is created.
	event NewMemo(
		address indexed from, 
		uint timestamp,
		string name,
		string message
	);

	// Memo struct
	struct Memo {
		address from;
		uint timestamp;
		string name;
		string message;
	}

	// List of all memos recieved from friends.
	Memo[] memos;

	// Address of contract deployer;
	address payable owner;

	// initialize owner to the one who deploys the smart contract
	constructor() {
		owner = payable(msg.sender);
	}

	/*
		* @dev buy a coffe for contract owner 
		* @param _name name o the cofee buyer
		* _message a nice message from the cofee buyer
	*/
	function buyCoffee(string memory _name, string memory _message) public payable {
		require(msg.value > 0, "ETH must be greater than 0.");

		memos.push(
			Memo(msg.sender, block.timestamp, _name, _message)
		);

		// emit event when some one buy a coffee 
		emit NewMemo(msg.sender, block.timestamp, _name, _message);
	}

	function withdrawTips() public payable {
		require(owner.send(address(this).balance));
	}

	// retrieve all memos stored in a blockchain
	function getMemos() public view returns(Memo[] memory) {
		return memos;
	}



}
