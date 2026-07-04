// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title QuorumValidatorRegistry
 * @dev On-chain contract managing validator voting keys and weight distribution parameters.
 */
contract QuorumValidatorRegistry is Ownable {

    struct NodeMetadata {
        bytes blsPublicKey;
        uint32 votingPowerWeight;
        bool isActive;
    }

    mapping(address => NodeMetadata) public validatorRegistry;
    uint32 public totalActiveVotingPower;

    event NodeRegistered(address indexed identity, bytes blsKey, uint32 weight);
    event NodeDeactivated(address indexed identity);

    constructor() Ownable(msg.sender) {}

    /**
     * @notice Registers a validation node into the consensus network directory.
     */
    function registerNode(address identity, bytes calldata blsKey, uint32 weight) external onlyOwner {
        require(weight > 0, "QuorumError: Weight parameter must exceed zero");
        require(!validatorRegistry[identity].isActive, "QuorumError: Validator node profile already active");

        validatorRegistry[identity] = NodeMetadata({
            blsPublicKey: blsKey,
            votingPowerWeight: weight,
            isActive: true
        });

        totalActiveVotingPower += weight;
        emit NodeRegistered(identity, blsKey, weight);
    }
}
