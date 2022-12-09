import { ethers } from "hardhat";

async function main() {
  // deploy contract
  const BuyMeACoffee = await ethers.getContractFactory("BuyMeACoffee");
  const buyMeACoffee = await BuyMeACoffee.deploy();

  buyMeACoffee.deployed();

  console.log(`BuyMeACoffee deployed to ${buyMeACoffee.address} address`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
