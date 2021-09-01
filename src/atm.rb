class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account) 
    #We will be using Ruby's "case" - "when" - "when" flow control statement
    # and check if ther are enough funds in the account
    case
    when account_is_disabled?(account.account_status)
      {status: false, message: 'account disabled', date: Date.today}
    when card_expired?(account.exp_date)
      { status: false, message: "card expired", date: Date.today }
    when incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: "wrong pin", date: Date.today }
    when insufficient_funds_in_account?(amount, account)
      #we exit the method if the amount we want to withdraw is
      # bigger than the balance on the account
      return { status: false, message: "insufficient funds in account", date: Date.today, amount: amount }
    when insufficient_funds_in_atm?(amount)
      { status: false, message: "insufficient funds in ATM", date: Date.today }
    else
      #If it's not, we perform the transaction
      perform_transaction(amount, account)
    end
  end

  private


  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def insufficient_funds_in_atm?(amount)
    amount > @funds
  end

  def account_is_disabled?(account_status)
    account_status == :disabled
  end


  def perform_transaction(amount, account)
    #we DEDUCT the amount from the Atm's funds
    @funds -= amount
    #We also DEDUCT the amount from the accounts balance
    account.balance = account.balance - amount
    #and we return a response for a succesfull withdraw.
    { status: true, message: "success", date: Date.today, amount: amount }
  end
end
