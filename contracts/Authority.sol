pragma solidity ^0.4.2;

import "Owned.sol";

contract Authority is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }

     /* The person or contract which can modify the register */
    address public controller;

    Person[] private people;

        struct Person {
            string legalName;
            uint ID;
            string visa;
            bool residency;
            bool military;
            bool insurance;
        }

    function addPerson ( string _legalName, uint _ID, string _visa) returns (bool success) {
        Person memory newPerson;
        newPerson.legalName = _legalName;
        newPerson.ID = _ID;
        newPerson.visa = _visa;
        newPerson.residency = false;
        newPerson.military = false;
        newPerson.insurance = false;

        people.push(newPerson);
        return true;
    }

    struct RecordInfo {
        string recordHash;
        uint timestamp;
    }

    mapping(address => RecordInfo[]) recordRegister;

    function addRecordInfo ( string _recordHash) returns (bool success) {
        RecordInfo memory newRecordInfo;
        newRecord.recordhHash = _recordHash;
        newPerson.timestamp = block.timestamp;
    }


    modifier onlyController {
        if (msg.sender != controller) throw;
    _;
    }

    function RecordVerifier(address registerController, uint256 , uint) {
        if (registerController == 0) registerController = msg.sender;
        controller = registerController;

    }

    function verifyRecord(address userAddress, string recordSha3Hash) constant returns (bool verified) {
        RecordInfo[] recordInfoA = recordRegister[userAddress];
        verified = false;
        for (uint i = 0; i < recordInfoA.length; i++) {
        RecordInfo recordInfo = recordInfoA[i];
        verified = ((recordInfo.recordHash == recordSha3Hash) && (recordInfo.recordType == recordType) && (recordSha3Hash != 0));
        if (verified) break;
        }
    }

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
