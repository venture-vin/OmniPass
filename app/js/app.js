$(function() {

//pseudocode below

function verify() {

var authority = Authority.deployed();
var identity = User.deployed();

var dataToVerify = identity.getIdentity(userAddress);

var verification = authority.verifyRecord(contractAddress, dataToVerify);

if (verification === true) {
    console.log("success!")
            //allow access to visa types & services
        }
        else {
            console.log("unable to verify")
            //write out instructions for user how to contact officials
        }
    }

}
