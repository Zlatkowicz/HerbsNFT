const eth = require('web3-eth');
const Contract = require('web3-eth-contract');

let account;
/* Resuelto con un task en hardhat config */
/* let balance = web3.eth.getBalance(0x5FbDB2315678afecb367f032d93F642f64180aa3); */

const connectMetamask = async () => {
    if(window.ethereum !== undefined) {
        const accounts = await ethereum.request({method: "eth_requestAccounts"});
        account = accounts[0];
        document.getElementById("AccountArea").innerHTML = account;
    }
}
