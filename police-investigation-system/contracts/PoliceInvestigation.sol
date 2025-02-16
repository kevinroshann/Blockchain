// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliceInvestigation {
    struct Case {
        uint id;
        string description;
        string policeId;
        string timestamp;
        string location;
    }

    struct Evidence {
        uint caseId;
        string evidenceId;
        string description;
        string hash;
    }

    Case[] public cases;
    Evidence[] public evidences;

    // Register a new case
    function registerCase(
        uint _id,
        string memory _description,
        string memory _policeId,
        string memory _timestamp,
        string memory _location
    ) public {
        cases.push(Case(_id, _description, _policeId, _timestamp, _location));
    }

    // Add evidence to a case
    function addEvidence(
        uint _caseId,
        string memory _evidenceId,
        string memory _description,
        string memory _hash
    ) public {
        evidences.push(Evidence(_caseId, _evidenceId, _description, _hash));
    }

    // Get case details by ID
    function getCase(uint _id) public view returns (
        string memory description,
        string memory policeId,
        string memory timestamp,
        string memory location
    ) {
        Case memory c = cases[_id];
        return (c.description, c.policeId, c.timestamp, c.location);
    }

    // Get evidence details by case ID
    function getEvidence(uint _caseId) public view returns (
        string memory evidenceId,
        string memory description,
        string memory hash
    ) {
        Evidence memory e = evidences[_caseId];
        return (e.evidenceId, e.description, e.hash);
    }
}