pragma solidity ^0.4.2;

import "Owned.sol";

contract Authority is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }
/* The person or contract which can modify the register */
// address public controller;

// Make a person hash to compare to the user identity

    struct Person {
        address creator;
        string legalName;
        uint ID;
        string visa;
        bool residency;
        bool military;
        bool insurance;
    }

    mapping (address => Person) public people;

    function addPerson(address addr, string _legalName, uint _ID, string _visa) returns (bool success) {
        Person memory person = Person({
        creator: addr,
        legalName: _legalName,
        ID: _ID,
        visa: _visa,
        residency: false,
        military: false,
        insurance: false
    });

    people[addr] = person;
    return true;
    }

    struct RecordInfo {
        string recordHash;
        uint timestamp;
    }

    mapping(address => RecordInfo) recordRegister;

    function addRecordInfo (address addr, string _recordHash) returns (bool success) {
        RecordInfo memory newRecordInfo = RecordInfo({
            recordHash: _recordHash,
            timestamp: block.timestamp
        });
        recordRegister[addr] = newRecordInfo;
    }

    function getLegalName(address addr) constant returns(string){
        var person = people[addr];
        return (person.legalName);
    }

    function getID(address addr) constant returns(uint){
        var person = people[addr];
        return (person.ID);
    }


    // modifier onlyController {
    //     if (msg.sender != controller) throw;
    // _;
    // }

    // function RecordVerifier(address registerController, uint256 , uint) {
    //     if (registerController == 0) registerController = msg.sender;
    //     controller = registerController;

    // }

    // function verifyRecord(address userAddress, string recordSha3Hash) constant returns (bool verified) {

    //     //pseudocode
    //     //need to basically iterate over each structure and do a compare side by side of each hash, could possibly stringify the hash and the array and then compare variables, which will need to be in the same order in each data structure
    //     //sha3(string1) == sha3(string);

    //     RecordInfo[] recordInfoA = recordRegister[userAddress];
    //     verified = false;
    //     for (uint i = 0; i < recordInfoA.length; i++) {
    //     RecordInfo recordInfo = recordInfoA[i];
    //     verified = ((recordInfo.recordHash == recordSha3Hash) && (recordInfo.recordType == recordType) && (recordSha3Hash != 0));
    //     if (verified) break;
    //     }
    // }

}


    //would like to implement a fixed array for visa types to be included in the person factory below

    // VisaType[] public visaTypes;

    // struct VisaType {
    //     bytes32: tourist;
    //     bytes32: transit;
    //     bytes32: service;
    //     bytes32: longTermVisit;
    //     bytes32: touristMultiple;
    //     bytes32: longTermVisitMultiple;
    // }
