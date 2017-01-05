pragma solidity ^0.4.2;

import "Proxy.sol";
import "Owned.sol";

contract Controller is Owned {
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

    address proxy;

    mapping (address => Identity) public identities;

    // function createIdentity(address addr, string name,  string _email) returns(bool){
    //     Identity memory identity = Identity({creator: addr, username: name, email: _email });
    //     identities[addr] = identity;
    //     proxy = new Proxy(addr, name, _email);
    //     // proxy.createIdentity(addr, name, _email);
    //     return true;
    // }
    function createIdentity(address addr, string name,  string _email) returns(address proxyAddress){
        // Identity memory identity = Identity({creator: addr, username: name, email: _email });
        // identities[addr] = identity;
        proxy = new Proxy();
        Proxy(proxy).createIdentity(addr, name, _email);
        // return address(new Proxy(addr, name, _email))
        return proxy;
    }

    function getUsername(address addr) returns(string){
        var person = identities[addr];
        return person.username;
        // TODO: Call the proxy contract for the username and email; storing it there
        // instead of the controller
        // return Proxy(proxy).getUsername(addr);
    }

    function getEmail(address addr) returns(string){
        var person = identities[addr];
        return person.email;
    }

    function getProxyAddress(address addr) returns(address){
        return proxy;
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
}
