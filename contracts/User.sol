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
    // - Birthday
    // - Passport expiration status

    struct Identity {
        address creator;
        string username;
        string email;
        string legalName;
        string ID;
        string visa;
        bool residency;
        bool military;
        bool insurance;
        uint256 birthday;
    }

    mapping (address => Identity) public identities;


    function createIdentity(address addr, string _username,  string _email, string _legalName, string _ID, uint256 _birthday, string _visa) returns(bool){
        Identity memory identity = Identity({
            creator: addr,
            username: _username,
            email: _email,
            legalName: _legalName,
            ID: _ID,
            birthday: _birthday,
            visa: _visa,
            residency: false,
            military: false,
            insurance: false
        });
        identities[addr] = identity;
        return true;
    }

    function getUsername(address addr) constant returns(string){
        var person = identities[addr];
        return person.username;
    }

    function getEmail(address addr) constant returns(string){
        var person = identities[addr];
        return person.email;
    }

    function getIdentity(address addr) constant returns(string, string, string, string, uint256){
        var person = identities[addr];
        return (person.username, person.email, person.legalName, person.ID, person.birthday);
    }

    function getResidency(address addr) constant returns(bool){
        var person = identities[addr];
        return person.residency;
    }

    function getMilitaryStatus(address addr) constant returns(bool){
        var person = identities[addr];
        return person.military;
    }

    function getInsurance(address addr) constant returns(bool){
        var person = identities[addr];
        return person.insurance;
    }

    function updateIdentity(address addr, string _username,  string _email, string _legalName, string _ID) returns(bool){
        var person = identities[addr];
        person.username = _username;
        person.email = _email;
        person.legalName = _legalName;
        person.ID = _ID;
        return true;
    }

    // It'll need access to the users private key and it would store the public key
        // Whats the data structure

    // A recovery process: if the user loses their private key
        // Have a set of one time use 20 hexadecimals to input

    // The owner can change the owner address: timelocked feature

    // For a first time creation, a controller contract creates a proxy contract and holds
    // reference to it; it can also change the ownership of that proxt to a different
    // controller
        // Does the controller create the contract of the invocation of the contract?

    // Self destruct function along with owned contracts
        // How to self destruct dependent contracts?

    // Holds a hashed value set by symmetric keys that points to a url

    // Sends a message back to the Proxy contract setting a specific value?

    // Have a list of third party dapps to interact with?

    // Booleans for a specific value stored here? Only if they need to be verified by a
    // third party

    // Gives json web tokens

}
