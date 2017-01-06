pragma solidity ^0.4.2;

import "Owned.sol";

contract Authority is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }

    // Hash of attributes: needs to be hashed with symmetric keys - selectively public
    // - Visa type
    // - Birthday
    // - Passport expiration status

    VisaType[] public vistaTypes;

    struct VisaType {
        bytes32: tourist;
        bytes32: transit;
        bytes32: service;
        bytes32: longTermVisit;
        bytes32: touristMultiple;
        bytes32: longTermVisitMultiple;
    }


    function createVisaType(address addr, string _username,  string _email, string _legalName, string _ID) returns(bool){
        VisaType memory identity = VisaType({
            creator: addr,
            username: _username,
            legalName: _legalName,
            email: _email,
            ID: _ID,
            residency: false,
            military: false,
            insurance: false
        });
        visaTypes[addr] = identity;
        return true;
    }

    function getAuthorityname(address addr) returns(string){
        var person = visaTypes[addr];
        return person.username;
    }

    function getEmail(address addr) returns(string){
        var person = visaTypes[addr];
        return person.email;
    }

    function getVisaType(address addr) returns(string, string, string, string){
        var person = visaTypes[addr];
        return (person.username, person.email, person.legalName, person.ID);
    }

    function getResidency(address addr) returns(bool){
        var person = visaTypes[addr];
        return person.residency;
    }

    function getMilitaryStatus(address addr) returns(bool){
        var person = visaTypes[addr];
        return person.military;
    }

    function getInsurance(address addr) returns(bool){
        var person = visaTypes[addr];
        return person.insurance;
    }

    function updateVisaType(address addr, string _username,  string _email, string _legalName, string _ID) returns(bool){
        var person = visaTypes[addr];
        person.username = _username;
        person.email = _email;
        person.legalName = _legalName;
        person.ID = _ID;
        return true;
    }
