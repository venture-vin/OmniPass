contract('Authority', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var authority = Authority.deployed();

    return authority.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first account");
    })

  });

});
