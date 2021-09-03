require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :account_status, :owner, :balance, :pin_code, :exp_date

  def initialize(attrs = {})
    @account_status = :active
    set_owner(attrs[:owner])
    @balance = 0
    @pin_code = set_pin
    @exp_date = set_expire_date
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  # we are using the instance method because we don't need any additional functionality that the class method could give other objects of the class.
  def deactivate
    @account_status = :deactivated
  end

  def set_pin
    rand(1000..9999)
    
  end

  private

  def set_owner(obj)
    obj.nil? ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end
end
