contract('User', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var user = User.deployed();

    return user.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first account");
    })

  });

  it("creates an identity", function() {
    var proxy = Proxy.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'

    return proxy.createIdentity(accounts[1], testName, testEmail).then((data) => {

      return proxy.getUsername.call(accounts[1])

    }).then((username) => {

      assert.equal(username, testName, "The function getUsername returns " + testName);
      return proxy.getEmail.call(accounts[1])

    }).then((email) => {
      assert.equal(email, testEmail, "The function getEmail returns " + testEmail);

      return true
    })

  });

});
