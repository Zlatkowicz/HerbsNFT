let account;
const connectMetamask = async () => {
    if(window.ethereum !== undefined) {
        const accounts = await ethereum.request({method: "eth_requestAccounts"});
        account = accounts[0];
        document.getElementById("AccountArea").innerHTML = account;
    }
}