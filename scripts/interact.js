async function main() {
    const [deployer] = await ethers.getSigners();
  
    const Herbs = await ethers.getContractFactory("Herbs");
    const herbs = await Herbs.attach("0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9");
  
    // Llamar a una función en el contrato
    const result = await herbs.mint("Playadito");
  
    console.log("Result:", result);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
});