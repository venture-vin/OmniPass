pragma solidity ^0.4.2;

import "Owned.sol";

contract Registry is Owned {
    event Forwarded (address indexed destination,uint value,bytes data);
    function forward(address destination, uint value, bytes data) onlyOwner {
        if (!destination.call.value(value)(data)) {throw;}
        Forwarded(destination, value, data);
    }

    // Holds a hashed value set by symmetric keys that points to a url

    // Sends a message back to the Proxy contract setting a specific value?

    // Have a list of third party dapps to interact with?

    // Booleans for a specific value stored here? Only if they need to be verified by a
    // third party

    // Gives json web tokens

}
