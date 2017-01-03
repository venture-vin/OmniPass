pragma solidity ^0.4.2;

import "ConvertLib.sol";
import "Owned.sol";

contract Proxy is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }

    struct Identity {
        address creator;
        string username;
        string email;
    }

    mapping (address => Identity) public identities;

    function Proxy(address addr, string name,  string _email){
        owner = msg.sender;
        Identity memory identity = Identity({creator: addr, username: name, email: _email });
        identities[addr] = identity;
    }

    function createIdentity(address addr, string name,  string _email) returns(bool){
        Identity memory identity = Identity({creator: addr, username: name, email: _email });
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

    // Hash of attributes: needs to be hashed with symmetric keys - selectively public
    // - ID
    // - Name
    // - Visa type
    // - Insured/Uninsured
    // - Birthday
    // - Passport expiration status
    // - Residency Status
    // - Military status
}
