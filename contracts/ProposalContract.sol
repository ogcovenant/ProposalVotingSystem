// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract ProposalContract {
    uint256 private counter;
    address owner;

    struct Proposal {
        string title;
        string description;
        uint256 approve;
        uint256 reject;
        uint256 pass;
        uint256 total_vote_to_end;
        bool current_state;
        bool is_active;
    }

    mapping(uint256 => Proposal) proposal_history;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner of this contract can create a proposal");
        _;
    }

    function create(string calldata _title, string calldata _description, uint256 _total_vote_to_end)
        external onlyOwner
    {
        counter += 1;
        proposal_history[counter] = Proposal(
            _title,
            _description,
            0,
            0,
            0,
            _total_vote_to_end,
            false,
            true
        );
    }

    function changeOwner( address new_owner ) external onlyOwner {
        owner = new_owner;
    }

    
}
