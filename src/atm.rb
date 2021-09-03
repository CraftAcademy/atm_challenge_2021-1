class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def withdraw(amount, pin_code, account)
    if account_is_disabled?(account.account_status)
      raise 'account disabled'
    elsif card_expired?(account.exp_date)
      raise 'card expired'
    elsif incorrect_pin?(pin_code, account.pin_code)
      raise'wrong pin'
    elsif insufficient_funds_in_account?(amount, account)
      raise'insufficient funds in account'
    elsif insufficient_funds_in_atm?(amount)
      raise 'insufficient funds in ATM'
    else
      perform_transaction(amount, account)
    end
  end

  private

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

  def correct_bills?(amount)
    denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount
    { status: true, message: 'success', amount: amount, bills: correct_bills?(amount) }
  end
end
