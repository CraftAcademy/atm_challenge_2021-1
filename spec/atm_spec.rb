require "./src/atm.rb"
require "date"
describe Atm do
  it "has 1000$ on initialize" do
    expect(subject.funds).to eq 1000
  end
  it "funds are reduced at withdraw" do
    subject.withdraw 50
    expect(subject.funds).to eq 950
  end

  let(:account) { instance_double("Account") }

  before do
    #Before each test we need to add an attribute to 'balance'
    #to the 'account' object and set the value to '100'
    allow(account).to receive(:balance).and_return(100)
    #We also need to allow 'account' to receive the new balance
    #using the setter methood 'balance='
    allow(account).to receive(:balance=)
  end

  it "allow withdraw if the account has enough balance." do
    #We need to tell the spec what to look for as a response
    #and store it in a variable 'expected_output'.

    expected_output = { status: true, message: "success", date: Date.today, amount: 45 }

    #Need 2 arguments for the withdraw method.
    #The amount of money to withdraw & the 'account' object.
    #The reason for the 'account' object is that the ATM needs
    #the info about the 'accounts' balance to clear the transaction.

    expect(subject.withdraw(45, account)).to eq expected_output
  end
end
