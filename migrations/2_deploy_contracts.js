const Curator = artifacts.require("./Curator.sol");

module.exports = function(deployer) {
  deployer.deploy(Curator, []);
};
