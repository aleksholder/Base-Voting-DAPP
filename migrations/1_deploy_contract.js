const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
  const proposalNames = ['Proposal 1', 'Proposal 2', 'Proposal 3'];
  const totalTokens = 100;
  deployer.deploy(Voting, proposalNames, totalTokens);
};
