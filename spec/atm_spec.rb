require "./src/atm.rb"
require 'date'

describe Atm do
    let(:account){instance_double('Account', pin_code: '1234', exp_date: "12/22",
    account_status: :active)}
    
    it "has 1000$ on initialize" do
        expect(subject.funds).to eq 1000
    end
    it 'funds are reduced at withdraw' do
        subject.withdraw(50, '1234', account)
        expect(subject.funds).to eq 950
    end

    before do
      #Before each test we need to add an attribute to 'balance'
      #to the 'account' object and set the value to '100'
      allow(account).to receive(:balance).and_return(100)
      #We also need to allow 'account' to receive the new balance
      #using the setter method 'balance='
      allow(account).to receive(:balance=)
      #allow(account.to receive(:account_status=))
    end

    it 'allow withdraw if the account has enough balance.' do
        #We need to tell the spec what to look for as a response
        #and store it in a variable 'expected_output'. 

        expected_output = {status: true, message: 'success', date: Date.today, amount: 45}

        #Need 2 arguments for the withdraw method.
        #The amount of money to withdraw & the 'account' object.
        #The reason for the 'account' object is that the ATM needs
        #the info about the 'accounts' balance to clear the transaction.

        expect(subject.withdraw(45, '1234', account)).to eq expected_output
    end

    it 'rejects withdraw if the account does not have enought balance.' do
        expected_output = {status: false, message: 'insufficient funds in account', date: Date.today, amount: 150}
        expect(subject.withdraw(150, '1234', account)).to eq expected_output   
    end

    it "reject withdraw if ATM has insufficient funds" do
        #To prepare the test we want to decrease the funds value
        # to a lower value then the original 1000
        subject.funds = 50
        #Then we set the "expected_output"
        expected_output = {status: false, message: "insufficient funds in ATM",
        date: Date.today }
        # And prepare our assertion/expectation.
        expect(subject.withdraw(100, '1234', account)).to eq expected_output
    end

    it 'reject withdraw if the pin is wrong' do
        expected_output = {status: false, message: 'wrong pin', date: Date.today}
        expect(subject.withdraw(50, '9999', account)).to eq expected_output
    end

    it "reject withdraw if the card is expired" do
        allow(account).to receive(:exp_date).and_return("12/15")
        expected_output = {status: false, message: "card expired", date: Date.today }
        expect(subject.withdraw(6, '1234', account)).to eq expected_output
    end

    it 'rejects withdraw if the account is disabled' do
        allow(account).to receive(:account_status).and_return(:disabled)
        expected_output = {status: false, message: 'account disabled', date: Date.today}
        expect(subject.withdraw(50, '1234', account)).to eq expected_output
    end
end