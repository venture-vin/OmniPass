module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.autolink();
  deployer.deploy(Proxy);
  deployer.deploy(Controller);
  deployer.deploy(Registry);
};
