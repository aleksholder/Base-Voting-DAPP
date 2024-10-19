// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Proposal {
        string name;
        uint voteCount;
    }

    address public owner;
    mapping(address => uint) public tokens;
    Proposal[] public proposals;

    constructor(string[] memory proposalNames, uint totalTokens) {
        owner = msg.sender;
        tokens[owner] = totalTokens;
        
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    function vote(uint proposalIndex, uint tokenAmount) public {
        require(tokens[msg.sender] >= tokenAmount, "Not enough tokens.");
        proposals[proposalIndex].voteCount += tokenAmount;
        tokens[msg.sender] -= tokenAmount;
    }

    function getProposal(uint index) public view returns (string memory, uint) {
        return (proposals[index].name, proposals[index].voteCount);
    }

    function getWinner() public view returns (string memory winnerName) {
        uint winningVoteCount = 0;
        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winnerName = proposals[i].name;
            }
        }
    }

    function transferTokens(address to, uint amount) public {
        require(tokens[msg.sender] >= amount, "Not enough tokens.");
        tokens[msg.sender] -= amount;
        tokens[to] += amount;
    }
}
