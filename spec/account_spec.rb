require "./src/account.rb"
require "date"

describe Account do
  
  it 'is expect to have an expiry date on initalize' do
    #Setting the validity of the card to 5 years as default
    expect_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.set_expire_date).to eq expect_date
  end
end
