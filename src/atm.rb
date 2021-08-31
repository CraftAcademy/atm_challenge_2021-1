class Atm
    attr_accessor :funds

    def initialize
        @funds = 1000
    end
end

def withdraw(amount, account)
    #We will be using Ruby's "case" - "when" - "when" flow control statement
    # and check if ther are enough funds in the account
    case
    when amount > account.balance
    #we exit the method if the amount we want to withdraw is
    # bigger than the balance on the account
        return
    else
        #If it's not, we perform the transaction
        #we DEDUCT the amount from the Atm's funds
        @funds -= amount
        #We also DEDUCT the amount from the accounts balance
        account.balance = account.balance - amount
        #and we return a response for a succesfull withdraw.
        { status: true, message: "success", date: Date.today, amount: amount}
    end
end


