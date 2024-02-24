/*-- -------------------------------- Requires -------------------------------- --*/
require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ignition-ethers");
require("@nomicfoundation/hardhat-toolbox");
/*-- -------------------------------- Requires -------------------------------- --*/


/*-- -------------------------------- Tasks -------------------------------- --*/

task("balance", "Prints an account's balance")
  .addParam("account", "The account's address")
  .setAction(async (taskArgs) => {
    const balance = await ethers.provider.getBalance(taskArgs.account);

    console.log(ethers.formatEther(balance), "ETH");
});
task("hello", "Prints 'Hello, World!'", async () => {
  console.log("Hello, World!");
});

/*-- -------------------------------- Tasks -------------------------------- --*/

module.exports = {
  solidity: "0.8.18",
  etherscan: {
    apiKey: "GUUEAXU7TQHPHUM6XYJGIZ67S7H96HMP3E",
  },
  
  settings: {
    optimizer: {
      enabled: true,
      runs: 200,
    },
  },
}
/* task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
}) */
