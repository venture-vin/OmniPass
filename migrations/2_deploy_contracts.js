module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.autolink();
  deployer.deploy(Proxy);
  deployer.deploy(Controller);
  deployer.deploy(Registry);
  deployer.deploy(User);
  deployer.deploy(Authority);
  deployer.deploy(Owned);
};
