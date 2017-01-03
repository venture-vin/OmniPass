pragma solidity ^0.4.2;

import "ConvertLib.sol";

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

contract Proxy is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }
    struct PersonData {
        address owner;
        uint id_number;
        string full_name;
        uint birthday;
        bool insured; //if true, already insured
        bool passport_expired; //if true, already expired
        bool residency; //if true, already a resident
        bool military; //if true, already a member of military
    }

    mapping(address => PersonData) public personDatas;

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
