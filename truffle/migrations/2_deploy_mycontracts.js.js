// 2_deploy_mycontracts.js

const charityFundraiser = artifacts.require("CharityFundraiser");
const donationVerification = artifacts.require("NFTContract");

module.exports = function(deployer) {
  //const charity_organization_address = "0xb91e013f8CED0aB01B4b3dDE478fA0a5E10f2587";
  deployer.deploy(charityFundraiser);
  deployer.deploy(donationVerification);
};
