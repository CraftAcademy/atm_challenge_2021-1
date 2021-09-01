class Account
STANDARD_VALIDITY_YRS = 5

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end
end