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

  it("creates multiple identities that can be accessed by account address", function() {
    var proxy = Proxy.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'
    var userName = 'user_name'
    var userEmail = 'user@email.com'

    return proxy.createIdentity(accounts[1], testName, testEmail)
      .then((data) => {

        return proxy.createIdentity(accounts[2], userName, userEmail).then((data) => {

        })
          .then(() => {
            return proxy.getUsername.call(accounts[1])
          })
          .then((username) => {

            assert.equal(username, testName, "The function getUsername returns " + testName);
            return proxy.getEmail.call(accounts[1])

          })
          .then((email) => {
            assert.equal(email, testEmail, "The function getEmail returns " + testEmail);

            return proxy.getUsername.call(accounts[2])

          })
          .then((username) => {

            assert.equal(username, userName, "The function getUsername returns " + testName);
            return proxy.getEmail.call(accounts[2])

          })
          .then((email) => {
            assert.equal(email, userEmail, "The function getEmail returns " + testEmail);
          });

      });

  });

});
