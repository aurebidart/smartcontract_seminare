// 2_deploy_mycontracts.js

const charityFundraiser = artifacts.require("charityFundraiser");
const donationVerification = artifacts.require("donationVerification");

module.exports = function(deployer) {
  const charity_organization_address = "0xb91e013f8CED0aB01B4b3dDE478fA0a5E10f2587";
  deployer.deploy(charityFundraiser, charity_organization_address);
  deployer.deploy(donationVerification, charity_organization_address);
};
