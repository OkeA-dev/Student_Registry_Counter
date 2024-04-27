const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");



module.exports = buildModule("StudentRegistryModule", (m) => {
  console.log("deployment is about to start");

  const studentRegistry = m.contract("StudentRegistry", []);

  return { studentRegistry };
});
