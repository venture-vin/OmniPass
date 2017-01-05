contract('User', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var user = User.deployed();

    return user.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first account");
    })

  });

  it("creates an identity", function() {
    var user = User.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'
    var testFullName = 'Legal Name'
    var testId = 'testid1234'

    return user.createIdentity(accounts[1], testName, testEmail, testFullName, testId).then((data) => {

      return user.getUsername.call(accounts[1])

    }).then((username) => {

      assert.equal(username, testName, "The function getUsername returns " + testName);
      return user.getEmail.call(accounts[1])

    }).then((email) => {
      assert.equal(email, testEmail, "The function getEmail returns " + testEmail);

      return true
    })

  });

  it("creates multiple identities that can be accessed by account address", function() {
    var user = User.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'
    var testFullName = 'Legal Name'
    var testId = 'testid1234'

    var userName = 'user_name'
    var userEmail = 'user@email.com'
    var userFullName = 'Legal Name'
    var userId = 'testid1234'

    return user.createIdentity(accounts[1], testName, testEmail, testFullName, testId)
      .then((data) => {

        return user.createIdentity(accounts[2], userName, userEmail, userFullName, userId).then((data) => {

        })
          .then(() => {
            return user.getUsername.call(accounts[1])
          })
          .then((username) => {

            assert.equal(username, testName, "The function getUsername returns " + testName);
            return user.getEmail.call(accounts[1])

          })
          .then((email) => {
            assert.equal(email, testEmail, "The function getEmail returns " + testEmail);

            return user.getUsername.call(accounts[2])

          })
          .then((username) => {

            assert.equal(username, userName, "The function getUsername returns " + testName);
            return user.getEmail.call(accounts[2])

          })
          .then((email) => {
            assert.equal(email, userEmail, "The function getEmail returns " + testEmail);
          });

      });

  });

  it("getIdentity returns username, email, full name and id", function() {
    var user = User.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'
    var testFullName = 'Legal Name'
    var testId = 'testid1234'

    return user.createIdentity(accounts[1], testName, testEmail, testFullName, testId).then((data) => {

      return user.getIdentity.call(accounts[1])

    }).then((identity) => {

      assert.equal(identity[0], testName, "The function getIdentity returns " + testName);
      assert.equal(identity[1], testEmail, "The function getIdentity returns " + testEmail);
      assert.equal(identity[2], testFullName, "The function getIdentity returns " + testFullName);
      assert.equal(identity[3], testId, "The function getIdentity returns " + testId);

      return true
    })

  });

  it("getResidency returns a boolean false by default", function() {
    var user = User.deployed();
    var testName = 'test_name'
    var testEmail = 'test@email.com'
    var testFullName = 'Legal Name'
    var testId = 'testid1234'

    return user.createIdentity(accounts[1], testName, testEmail, testFullName, testId).then((data) => {

      return user.getResidency.call(accounts[1])

    }).then((residency) => {

      assert.equal(residency, false, "The function getResidency returns false.");

      return true
    })

  });


});
