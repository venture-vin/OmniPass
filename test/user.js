contract('User', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var user = User.deployed();

    return user.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first account");
    })

  });

});
