pragma solidity ^0.4.2;

import "Owned.sol";

contract Authority is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }

    address public controller;

    VisaType[] public visaTypes;

    struct VisaType {
        bytes32: tourist;
        bytes32: transit;
        bytes32: service;
        bytes32: longTermVisit;
        bytes32: touristMultiple;
        bytes32: longTermVisitMultiple;
    }

    struct RecordInfo {
        uint recordType;
        bytes32 recordHash;
        uint timestamp;
        string provider;
    }

    modifier onlyController {
        if (msg.sender != controller) throw;
    _
    }

    function RecordVerifier(address registerController, uint256 defaultServicePrice, uint defaultValidityPeriod) {
        if (registerController == 0) registerController = msg.sender;
        controller = registerController;
        if (defaultServicePrice == 0) defaultServicePrice = 10 finney; //0.01 ether
        servicePrice = defaultServicePrice;
        servicePriceCompanies = defaultServicePrice;
        if (defaultValidityPeriod ==0) defaultValidityPeriod = 31536000; // 1 year
        validityPeriod = defaultValidityPeriod;
    }

    function isRecordVerified(address userAddress, uint recordType, bytes32 recordSha3Hash) constant returns (bool verified) {
        RecordInfo[] recordInfoA = recordRegister[userAddress];
        verified = false;
        for (uint i = 0; i < recordInfoA.length; i++) {
        RecordInfo recordInfo = recordInfoA[i];
        verified = ((recordInfo.recordHash == recordSha3Hash) && (recordInfo.recordType == recordType) && (recordSha3Hash != 0));
        if (verified) break;
        }
    }

    }
