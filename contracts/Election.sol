pragma solidity ^0.5.0;

contract Election{

    //Read/writeCandidate
    string public candidate;

    // Model a Candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    //liste de collection des candidates qui peuvent etre read/write Candidate
    mapping(uint =>Candidate) public candidates;

    // Store accounts that have voted
    mapping(address => bool) public voters;

    //Store Candidate count
    uint public candidatesCount; 

    //Constructor
    constructor() public
    {
        addCandidate("Samira");
        addCandidate("Nada");
        addCandidate("Leonel");
        addCandidate("Mouefek");
    }

    //function for add new Candidate
    function addCandidate(string memory _name) private{
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0);
    }

    // function for vote
    function vote (uint _candidateId) public {

    // require that they haven't voted before
    require(!voters[msg.sender]);

    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record that voter has voted
    voters[msg.sender] = true;

    // update candidate vote Count
    candidates[_candidateId].voteCount ++;
    }
}

