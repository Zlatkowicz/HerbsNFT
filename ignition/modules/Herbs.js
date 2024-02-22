const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");



module.exports = buildModule("Herbs", (m) => {

    const Herbs = m.contract("Herbs");

    m.call(Herbs, "mint", ["rosamonte"]);

    return { Herbs };
});