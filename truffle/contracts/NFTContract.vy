# @version ^0.3.7

# NFT Contract

# Structure to store information about each donation
struct DonationInfo:
    donor: address
    amount: uint256
    descritpion: String[50]

owner: public(address)
totalSupply: uint256
tokenID: uint256
donations: public(HashMap[uint256, DonationInfo])

event NFTCreated:
    tokenID: uint256
    donor: address
    amount: uint256
    descritpion: String[50]



# Initialize the contract
@external
def __init__():
    self.owner = msg.sender
    self.totalSupply = 0
    self.tokenID = 1

# Create and distribute NFTs to donors based on their donation amounts
@external
def createNFT(owner: address, donor: address, donationAmount: uint256, descritpion: String[50]):
    assert owner == self.owner, "Only the contract owner can create NFTs"
    assert donationAmount > 0, "Donation amount must be greater than 0"

    self.donations[self.tokenID] = DonationInfo({
        donor: donor,
        amount: donationAmount,
        descritpion: descritpion
    })

    log NFTCreated(self.tokenID, donor, donationAmount, descritpion)

    self.totalSupply += 1

    self.tokenID += 1

# Get the metadata of a specific NFT
@external
@view
def getNFTMetadata(tokenID: uint256) -> String[50]:
    return self.donations[tokenID].descritpion

# Get the donation amount of a specific NFT
@external
@view
def getNFTDonationAmount(tokenID: uint256) -> uint256:
    return self.donations[tokenID].amount

# Get the donor of a specific NFT
@external
@view
def getNFTDonor(tokenID: uint256) -> address:
    return self.donations[tokenID].donor