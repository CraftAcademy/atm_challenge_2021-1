require "./src/account.rb"
require "date"

describe Account do
  let(:person) { instance_double("Person", name: "Thomas") }

  subject { described_class.new({ owner: person }) }

  it "is expected to have an owner" do
    expect(subject.owner).to eq person
  end

  it "is expect to have an expiry date on initalize" do
    #Setting the validity of the card to 5 years as default
    expect_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.set_expire_date).to eq expect_date
  end

  it "is expected to have :active status on initialize" do
    expect(subject.account_status).to eq :active
  end

  it "deactivates account using the instance method" do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end

  it "is expected to raise error if no owner is set" do
    expect { described_class.new }.to raise_error "An Account owner is required"
  end

  it "is expected that an account has a pin code that is 4 digits long" do
    number = 1234
    pin_number = Math.log10(number).to_i + 1
    expect(subject.pin_number).to eq 4
  end
end
