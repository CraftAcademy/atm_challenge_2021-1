class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :account_status

  def initialize(attrs = {})
    @account_status = :active
    set_owner(attrs[:owner])
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

  #we are using the instance method because we don't need any additional functionality that the class method could give other objects of the class.
  def deactivate
    @account_status = :deactivated
  end

  private

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise "An Account owner is required"
  end
end
