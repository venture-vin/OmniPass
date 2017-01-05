pragma solidity ^0.4.2;

import "Owned.sol";

contract User is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }

    // Hash of attributes: needs to be hashed with symmetric keys - selectively public
    // - Visa type
    // - Insured/Uninsured
    // - Birthday
    // - Passport expiration status

    struct Identity {
        address creator;
        string username;
        string email;
        string legalName;
        string ID;
        bool residency;
        bool military;
    }

    mapping (address => Identity) public identities;

    function createIdentity(address addr, string _username,  string _email, string _legalName, string _ID) returns(bool){
        Identity memory identity = Identity({
            creator: addr,
            username: _username,
            legalName: _legalName,
            email: _email,
            ID: _ID,
            residency: false,
            military: false
        });
        identities[addr] = identity;
        return true;
    }

    function getUsername(address addr) returns(string){
        var person = identities[addr];
        return person.username;
    }

    function getEmail(address addr) returns(string){
        var person = identities[addr];
        return person.email;
    }

    function getIdentity(address addr) returns(string, string, string, string){
        var person = identities[addr];
        return (person.username, person.email, person.legalName, person.ID);
    }

    function getResidency(address addr) returns(bool){
        var person = identities[addr];
        return person.residency;
    }
}
