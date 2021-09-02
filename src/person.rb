require './src/atm'

class Person
  attr_accessor :name, :cash, :account, :atm,

  def initialize(attrs = {})
    @name = name
    set_name(attrs[:name])
    @cash = 1000
    @account = nil
    @atm = ()
   
    

    
    
  end

  def create_account
    @account = Account.new(owner: self)

    # @account.set_expire_date
  end

  def deposit(amount)
    @account.nil? ? missing_account : deposit_funds(amount)
  end

  def withdraw(args = {})
    @account == nil ? missing_account : withdraw_funds(amount)
    end

  private

  # binding.pry
  # To call upon a attribute of the Account Class, type @account.attribute
  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
    # binding.pry
  end

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    account = @account
    amount = args [:amount]
    pin = args [:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response 
    # @cash += amount
    # @account.balance -= amount
  end

  def increase_cash(response)
    @cash += response [:amount]
  end

  def set_name(obj)
    obj.nil? ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end

  def missing_account
    # binding.pry
    raise 'No account present'
  end
end
