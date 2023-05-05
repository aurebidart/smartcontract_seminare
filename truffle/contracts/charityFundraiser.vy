# @version ^0.3.7 

# Charity Fundraiser Smart Contract
owner: public(address)
charity_organization: public(address) # Address of the designated charitable organization
donations: public(HashMap[address, uint256]) # Record of donations received by donor address

@external
def __init__():
    self.owner = msg.sender

# Allows the owner to set the designated charitable organization
@external
def set_charity_organization(charity_organization: address):
    assert msg.sender == self.owner, "Only the owner can set the designated charitable organization"
    self.charity_organization = charity_organization

# Allows donors to make a donation to the Charity Fundraiser contract
@external
@payable
def donate():
    assert self.charity_organization != ZERO_ADDRESS, "The designated charitable organization must be set before donations can be received"
    assert msg.value > 0, "Donation amount must be greater than 0"
    self.donations[msg.sender] += msg.value

# Allows the designated charitable organization to withdraw donations received
@external
def withdraw():
    assert self.charity_organization != ZERO_ADDRESS, "The designated charitable organization must be set before donations can be received"
    assert msg.sender == self.charity_organization, "Only the designated charitable organization can withdraw donations"
    # Define amount has the total amount of the contract balance
    amount: uint256 = self.balance
    # Transfer the total amount of the contract balance to the designated charitable organization
    send(self.charity_organization, amount)
    # Assert that the contract balance is now 0
    assert self.balance == 0, "Contract balance must be 0 after withdrawal"

