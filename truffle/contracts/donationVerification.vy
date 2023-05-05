# @version ^0.3.7

# External Interfaces
interface Charityfundraiser:
    def set_charity_organization(charity_organization: address): nonpayable
    def donate(): payable
    def withdraw(): nonpayable
    def owner() -> address: view
    def charity_organization() -> address: view
    def donations(arg0: address) -> uint256: view

# Define the Donation Verification contract
owner: public(address) # Address of the owner of the contract
charity_organization: address # Address of the Charity organization

@external
def __init__():
    self.owner = msg.sender
    self.charity_organization = Charityfundraiser(msg.sender).charity_organization()

# Allows donors to verify their donations
@external
@view
def verify_donation() -> uint256:
    # Return the total amount of donations made by the sender
    return Charityfundraiser(self.charity_fundraiser).donations(msg.sender)