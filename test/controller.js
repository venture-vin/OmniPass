contract('Controller', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var proxy = Proxy.deployed();

    return proxy.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first accounts");
    })

  });

});

