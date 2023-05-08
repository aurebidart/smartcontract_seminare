# @version ^0.3.7 

# Structure to store information about each donation
struct DonationInfo:
    donor: address
    amount: uint256
    descritpion: String[50]

# External Interfaces
interface Nftcontract:
    def createNFT(owner: address, donor: address, donationAmount: uint256, descritpion: String[50]): nonpayable
    def getNFTMetadata(tokenID: uint256) -> String[50]: view
    def getNFTDonationAmount(tokenID: uint256) -> uint256: view
    def getNFTDonor(tokenID: uint256) -> address: view
    def owner() -> address: view
    def donations(arg0: uint256) -> DonationInfo: view

# Charity Fundraiser Smart Contract
owner: public(address)
charity_organization: public(address) # Address of the designated charitable organization
donations: HashMap[address, uint256] # Record of donations received by donor address
nft_contract: address # Address of the NFT contract

@external
def __init__():
    self.owner = msg.sender

# Allows the owner to set the designated charitable organization
@external
def set_charity_organization(charity_organization: address):
    assert msg.sender == self.owner, "Only the owner can set the designated charitable organization"
    self.charity_organization = charity_organization

# Allows the owner to set the NFT contract address
@external
def set_nft_contract(nft_contract: address):
    assert msg.sender == self.owner, "Only the owner can set the NFT contract address"
    self.nft_contract = nft_contract


# Allows donors to make a donation to the Charity Fundraiser contract
@external
@payable
def donate():
    assert self.charity_organization != empty(address), "The designated charitable organization must be set before donations can be received"
    assert msg.value > 0, "Donation amount must be greater than 0"
    self.donations[msg.sender] += msg.value
    # Create an NFT for the donor
    Nftcontract(self.nft_contract).createNFT(self.owner, msg.sender, msg.value, "Donation")

# Allows the designated charitable organization to withdraw donations received
@external
def withdraw():
    assert self.charity_organization != empty(address), "The designated charitable organization must be set before donations can be received"
    assert msg.sender == self.charity_organization, "Only the designated charitable organization can withdraw donations"
    # Define amount has the total amount of the contract balance
    amount: uint256 = self.balance
    # Transfer the total amount of the contract balance to the designated charitable organization
    send(self.charity_organization, amount)
    # Assert that the contract balance is now empty
    assert self.balance == 0, "Contract balance must be 0 after withdrawal"

@external
@view
def get_donation_amount(donor: address) -> uint256:
    return self.donations[donor]

