pragma solidity ^0.4.2;

contract Owned {
    address public owner;
    modifier onlyOwner(){ if (isOwner(msg.sender)) _; }
    modifier ifOwner(address sender) { if(isOwner(sender)) _; }
    function Owned(){
        owner = msg.sender;
    }
    function isOwner(address addr) public returns(bool) { return addr == owner;
    }
    function transfer(address _owner) onlyOwner {
        owner = _owner;
    }
}

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

    // Identity[] identities;

    mapping (address => Identity) public identities;

    function createIdentity(address addr, string name,  string _email) returns(bool){
        // http://ethereum.stackexchange.com/questions/4467/initialising-structs-to-storage-variables
        Identity memory identity = Identity({creator: addr, username: name, email: _email });
        // identities.push(identity);
        identities[addr] = identity;
    }

    function getUsername(address addr) returns(string){
        var person = identities[addr];
        return person.username;
    }

    function getEmail(address addr) returns(string){
        var person = identities[addr];
        return person.email;
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
