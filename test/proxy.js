contract('Proxy', function(accounts) {
  it("should have an owner", function() {
    var proxy = Proxy.deployed();

    console.log(proxy)
    return proxy.owner
    // return meta.getBalance.call(accounts[0]).then(function(balance) {
    //   assert.equal(balance.valueOf(), 10000, "10000 wasn't in the first account");
    // });
  });

});
