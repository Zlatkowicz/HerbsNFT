const {assert} = require('chai');

require('chai')
.use(require('chai-as-promised'))
.should()

contract('Herbs', (accounts) => {
    let contract;

    before(async () => {
        contract = await Herbs.deployed();
    })
})