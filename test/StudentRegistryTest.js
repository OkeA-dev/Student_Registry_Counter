const { loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("StudentRegistyTest", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployStudentRegistryFixture() {
    

    // Contracts are deployed using the first signer/account by default
    const [owner, student1, student2, student3] = await ethers.getSigners();

    const StudentRegistry = await ethers.getContractFactory("StudentRegistry");
    const studentRegistry = await StudentRegistry.deploy();

    return { studentRegistry, owner, student1, student2, student3 };
  }

  describe("Deployment", function () {
    

    it("Should set the right owner", async function () {
      const { studentRegistry, owner } = await loadFixture(deployStudentRegistryFixture);

      expect(await studentRegistry.owner()).to.equal(owner.address);
    });

    it("Only owner can call registerStudent", async function () {
      const { studentRegistry, student1 } = await loadFixture(deployStudentRegistryFixture);

      await expect(studentRegistry.connect(student1).registerStudent("Oke", 20, 2002, 3)).to.be.revertedWith("Only the owner can perform this action");
    });

    it("Only owner can call editStudent", async function () {
      const { studentRegistry, student1 } = await loadFixture(deployStudentRegistryFixture);

      await expect(studentRegistry.connect(student1).editStudent(20, "Oke", 2002, 3)).to.be.revertedWith("Only the owner can perform this action");
    });

    it("Only owner can call deleteStudent", async function () {
      const { studentRegistry, student1 } = await loadFixture(deployStudentRegistryFixture);

      await expect(studentRegistry.connect(student1).deleteStudent(20)).to.be.revertedWith("Only the owner can perform this action");
    });

  });
});
