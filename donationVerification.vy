# @version ^0.3.7

# Define the Donation Verification contract
charity_fundraiser: address # Address of the Charity Fundraiser contract

# Interface to the Charity Fundraiser contract
interface CharityFundraiser:
    def donations(donor: address) -> uint256: view

@external
def __init__(charity_fundraiser_address: address):
    self.charity_fundraiser = charity_fundraiser_address

# Allows donors to verify their donations
@external
@view
def verify_donation() -> uint256:
    # Return the total amount of donations made by the sender
    return CharityFundraiser(self.charity_fundraiser).donations(msg.sender)