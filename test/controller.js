contract('Controller', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var proxy = Proxy.deployed();

    return proxy.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first accounts");
    })

  });

  it("creates an identity", function() {
    var controller = Controller.deployed();
    var testName = 'test_name'

    return controller.createIdentity(accounts[1], testName, 'test@email.com').then((data) => {
      // If it gets to this point, then that means the createIdentity function was run 
      // successfully and a transaction id is returned

      return controller.getUsername.call(accounts[1])
    }).then((username) => {
      assert.equal(username, testName, "The set the username to test_name");
    })

  });

});

