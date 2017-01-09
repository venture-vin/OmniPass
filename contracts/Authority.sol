pragma solidity ^0.4.2;

import "Owned.sol";

contract Authority is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }
    /* The person or contract which can modify the register to be implmented later */
    // address public controller;


    // Government created person's ID in the database
    struct Person {
        address creator;
        string legalName;
        uint256 birthday;
        string ID;
        string visa;
        bool residency;
        bool military;
        bool insurance;
    }

    mapping (address => Person) public people;

    function addPerson(address addr, string _legalName, uint256 _birthday, string _ID, string _visa) returns (bool success) {
        Person memory person = Person({
            creator: addr,
            legalName: _legalName,
            ID: _ID,
            visa: _visa,
            birthday: _birthday,
            residency: false,
            military: false,
            insurance: false
            });

        people[addr] = person;
        return true;
    }


    function getLegalName(address addr) constant returns(string){
        var person = people[addr];
        return (person.legalName);
    }

    function getID(address addr) constant returns(string){
        var person = people[addr];
        return (person.ID);
    }

    function getBirthday(address addr) constant returns(uint256){
        var person = people[addr];
        return (person.birthday);
    }

    // function verifyRecord(address addr, string _dataToVerify) constant returns (bool verified) {

    //     Person[] personArray = people[addr];
    //     var data = _dataToVerify;
    //     var legalName = String(data[3].split('));
    //     var birthday = String(data[4].split('));;

    //     verified = false;

    //     for (uint i = 0; i < personArray.length; i++) {
    //         Person[] person = personArray[i];
    //         verified = ((personArray[i].legalName == legalName) && (personArray[i].birthday == birthday) && (data != 0));
    //         if (verified) break;
    //     }
    // }
}


//would like to implement a fixed array for visa types to be included in the person factory

// VisaType[] public visaTypes;

// struct VisaType {
    //     bytes32: tourist;
    //     bytes32: transit;
    //     bytes32: service;
    //     bytes32: longTermVisit;
    //     bytes32: touristMultiple;
    //     bytes32: longTermVisitMultiple;
    // }
