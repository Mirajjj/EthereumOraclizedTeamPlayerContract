var sendEtherContract = artifacts.require("sendEther");

module.exports = function(deployer, network, accounts) {
  // deployment steps
  deployer.deploy(sendEtherContract);
};