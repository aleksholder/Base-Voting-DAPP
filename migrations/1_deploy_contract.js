const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
  const proposalNames = ['Proposal 1', 'Proposal 2', 'Proposal 3'];  // Инициализация предложений
  const totalTokens = 100;  // Количество токенов, доступных для распределения
  deployer.deploy(Voting, proposalNames, totalTokens);
};
