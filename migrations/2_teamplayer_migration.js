var TeamPlayerMigration = artifacts.require("TeamPlayer");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(TeamPlayerMigration);
};