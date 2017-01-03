contract('Controller', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var controller = Proxy.deployed();

    return controller.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first accounts");
    })

  });

  it("creates an identity", function() {
    var controller = Controller.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'

    return controller.createIdentity(accounts[1], testName, testEmail).then((data) => {
      // If it gets to this point, then that means the createIdentity function was run 
      // successfully and a transaction id is returned

      return controller.getUsername.call(accounts[1])
    }).then((username) => {
      assert.equal(username, testName, "The function getUsername returns " + testName);
      return controller.getEmail.call(accounts[1])
    }).then((email) => {
      assert.equal(email, testEmail, "The function getEmail returns " + testEmail);
    })

  });

  it("creates a proxy contract", () => {
    var controller = Controller.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'

    return controller.createIdentity(accounts[2], testName, testEmail).then((data) => {

      return controller.getProxyAddress.call(accounts[2]).then((address) => {
        assert.notEqual(data, address, "The controller and proxy address are not the same.");
      })

    })

  })

});

