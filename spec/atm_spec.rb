require './src/atm'
require 'date'

describe Atm do
  let(:account) do
    instance_double('Account', pin_code: '1234', exp_date: '12/22', account_status: :active)
  end

  it 'is expected to have 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end
  it 'is expected that funds are reduced at withdraw' do
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end

  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

  it 'is expected that withdrawl is allowed if the account has enough balance.' do
    expected_output = { status: true, message: 'success', amount: 45, bills: [20, 20, 5] }
    expect(subject.withdraw(45, '1234', account)).to eq expected_output
  end

  it 'is expected that withdrawl is rejected if the account does not have enought balance.' do
    expect{subject.withdraw(150, '1234', account)}.to raise_error 'insufficient funds in account'
  end

  it 'is expected to reject withdraw if ATM has insufficient funds' do
    subject.funds = 50
    expect{subject.withdraw(100, '1234', account)}.to raise_error 'insufficient funds in ATM'
    end

  it 'is expected to reject withdraw if the pin is wrong' do
    expect{subject.withdraw(50, '9999', account)}.to raise_error 'wrong pin'
  end

  it 'is expected to reject withdraw if the card is expired' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expect{subject.withdraw(6, '1234', account)}.to raise_error 'card expired'
  end
      
  it 'is expected to reject withdraw if the account is disabled' do
    allow(account).to receive(:account_status).and_return(:disabled)
    expect{subject.withdraw(50, '1234', account)}.to raise_error 'account disabled'
  end
end
