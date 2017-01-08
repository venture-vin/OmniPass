contract('Authority', function(accounts) {
  it("should have an owner thats set to the first account", function() {
    var authority = Authority.deployed();

    return authority.owner.call().then((data) => {
      assert.equal(data, accounts[0], "The owner is the first account");
    })

  });

  it("adds person", function() {
    var authority = Authority.deployed();
    var testFullName = 'Legal Name'
    var testId = '1234'
    var testVisa = 'tourist'

    return authority.addPerson(accounts[1], testFullName, testId, testVisa)
      .then((data) => {

        return authority.getLegalName.call(accounts[1])

      })
      .then((legalName) => {

        assert.equal(legalName, testFullName, "The function getLegalName returns " + testFullName);
        return authority.getID.call(accounts[1])

      })
      .then((id) => {

        assert.equal(id, testId, "The function getLegalName returns " + testId);
        return true

      })

  });

});
