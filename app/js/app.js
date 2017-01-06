$(function() {

var accounts;
var account;

//pseudocode below

  function checkResidency(meesage) {
    var identity = User.deployed();

    identity.getResidency.call(account, {from: account}).then(function(value){

    })

    identity.getVisa.call(account, {from: account}).then(function(value){

    })

/// We need a contract we'll call "Authority"
    var authority = Authorty.deployed();
    authority.verify (
    //   we plugin the sender's address into the solidity contract to verify the info is available
    // WIP for this, but a simple data struct and a === to verify that data is the same.
    // })
  }



}

// window.onload = function() {

// function setStatus(message) {
//   var status = document.getElementById("status");
//   status.innerHTML = message;
// };

// function refreshBalance() {
//   var meta = MetaCoin.deployed();

//   meta.getBalance.call(account, {from: account}).then(function(value) {
//     var balance_element = document.getElementById("balance");
//     balance_element.innerHTML = value.valueOf();
//   }).catch(function(e) {
//     console.log(e);
//     setStatus("Error getting balance; see log.");
//   });
// };

// function sendCoin() {
//   var meta = MetaCoin.deployed();

//   var amount = parseInt(document.getElementById("amount").value);
//   var receiver = document.getElementById("receiver").value;

//   setStatus("Initiating transaction... (please wait)");

//   meta.sendCoin(receiver, amount, {from: account}).then(function() {
//     setStatus("Transaction complete!");
//     refreshBalance();
//   }).catch(function(e) {
//     console.log(e);
//     setStatus("Error sending coin; see log.");
//   });
// };

// window.onload = function() {
//   web3.eth.getAccounts(function(err, accs) {
//     if (err != null) {
//       alert("There was an error fetching your accounts.");
//       return;
//     }

//     if (accs.length == 0) {
//       alert("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
//       return;
//     }

//     accounts = accs;
//     account = accounts[0];

//     refreshBalance();
//   });
// }
