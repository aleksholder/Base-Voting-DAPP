const Web3 = require('web3');
const contractABI = [ /* ABI of the contract */ ];
const contractAddress = '0x...'; // Your contract address

const web3 = new Web3(Web3.givenProvider || 'http://localhost:8545');
const votingContract = new web3.eth.Contract(contractABI, contractAddress);

async function vote(proposalIndex, tokenAmount) {
    const accounts = await web3.eth.getAccounts();
    await votingContract.methods.vote(proposalIndex, tokenAmount).send({ from: accounts[0] });
}

async function getProposal(index) {
    const proposal = await votingContract.methods.getProposal(index).call();
    console.log(`Proposal: ${proposal[0]}, Votes: ${proposal[1]}`);
}

async function getWinner() {
    const winner = await votingContract.methods.getWinner().call();
    console.log(`Winning proposal is: ${winner}`);
}
