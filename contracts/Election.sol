// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Election {
    
    // candidate model
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    // store accounts that've voted
    mapping(address => bool) public voters;

    // fetch candidate
    mapping(uint => Candidate) public candidates;

    // store number of candidates
    uint public candidatesCount;

    constructor () public {
        addCandidate("BoJack Horseman");
        addCandidate("Todd Chavez");
    }

    // add candidate
    function addCandidate(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // check if they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update vote count
        candidates[_candidateId].voteCount ++;
    }

}