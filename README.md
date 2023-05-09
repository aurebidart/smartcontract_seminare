# Charity Fundraiser Project

The Charity Fundraiser project is a decentralized application (DApp) built on the Ethereum blockchain that allows users to donate funds to a specific charity and receive non-fungible tokens (NFTs) representing their donations. The project consists of two smart contracts: the CharityFundraiser contract and the DonationNFT contract.

## CharityFundraiser Contract

The CharityFundraiser contract is responsible for accepting donations from users and managing the distribution of funds to the designated charitable organization. It keeps track of the total amount donated by each donor and allows the designated organization to withdraw the funds.

### Features

- Donors can make donations by sending ether to the contract.
- Donations are recorded in a mapping, associating each donor's address with the amount donated.
- The contract owner can set the designated charitable organization.
- The designated organization can withdraw the donations received.

### Integration with DonationNFT Contract

The CharityFundraiser contract integrates with the DonationNFT contract to provide donors with NFTs representing their donations.

- After a donation is made, an NFT is created in the DonationNFT contract.
- The NFT represents the donor's donation and includes metadata such as the donor's address and the donation amount.
- The NFT is assigned to the donor, providing a tokenized representation of their contribution.

## DonationNFT Contract

The DonationNFT contract is responsible for creating and managing the NFTs that represent the donations made through the CharityFundraiser contract.

### Features

- Creates NFTs to represent the donations made.
- Assigns the created NFTs to the respective donors.
- Stores metadata associated with each NFT, such as the donor's address and the donation amount.

## Getting Started

To deploy and interact with the Charity Fundraiser project, follow these steps:

1. Deploy the CharityFundraiser contract to the Ethereum blockchain, providing the address of the designated charitable organization and the address of the DonationNFT contract.

2. Deploy the DonationNFT contract to the Ethereum blockchain.

3. Interact with the CharityFundraiser contract through a web interface or directly using Ethereum wallets.

### Dependencies

- Ethereum blockchain
- Ethereum wallet (e.g., MetaMask)
- Vyper compiler

## Resources

- [Ethereum](https://ethereum.org/)
- [Vyper Documentation](https://vyperlang.readthedocs.io/)