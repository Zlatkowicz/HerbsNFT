require("@nomicfoundation/hardhat-toolbox");


module.exports = {
  solidity: "0.8.18",
  etherscan: {
    apiKey: "GUUEAXU7TQHPHUM6XYJGIZ67S7H96HMP3E",
  },
};
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});