const hre = require("hardhat");


// scripts/deploy.js
async function main() {
  const [deployer] = await ethers.getSigners();

  
  // Obtiene la instancia del contrato a desplegar
  const Herbs = await ethers.getContractFactory("Herbs");
  
  // Despliega el contrato
  const herbs = await Herbs.deploy();



  console.log("Contrato Herbs desplegado en:", herbs.address);
}

// Ejecuta la función principal
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});