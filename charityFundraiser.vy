# @version ^0.3.7 

# This is the interface for the Charity Fundraiser Smart Contract
# This interface allows donors to check its donation balance
interface CharityFundraiser:
    # Returns the donation balance of the donor address
    def donations(donor: address) -> uint256: view

# Charity Fundraiser Smart Contract
charity_organization: address # Address of the designated charitable organization
donations: HashMap[address, uint256] # Record of donations received by donor address

@external
def __init__(charity_organization_address: address):
    self.charity_organization = charity_organization_address

# Allows donors to make a donation to the Charity Fundraiser contract
@external
@payable
def donate():
    assert msg.value > 0, "Donation amount must be greater than 0"
    self.donations[msg.sender] += msg.value

# Allows the designated charitable organization to withdraw donations received
@external
def withdraw():
    assert msg.sender == self.charity_organization, "Only the designated charitable organization can withdraw donations"
    # Define amount has the total amount of the contract balance
    amount: uint256 = self.balance
    # Transfer the total amount of the contract balance to the designated charitable organization
    send(self.charity_organization, amount)
    # Assert that the contract balance is now 0
    assert self.balance == 0, "Contract balance must be 0 after withdrawal"

