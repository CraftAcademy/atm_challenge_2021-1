<h1>THE CODE</h1>
This code has been written to simulate a virtual ATM, simulating the machine, an account on it, and a user interacting with the ATM.

Dependencies 
The dependencies are as follows:
  RSPEC
  PRY
  
SETUP



INSTRUCTIONS
1. Launch irb

2. load './src/person.rb'
        './src/account.rb'
        './src/atm.rb'



To create a new instance of the Person Class type: person_1 = Person.new(name: 'name')
  To create a new instance of the Account Class type: account_1 = Account.new(owner: person_1)
  To create a new instance of the ATM Class type: atm_1 = Atm.new
  To give person_1 an account type: person_1.create_account  . To see full list of attributes type: person_1 into the terminal.

  To deposit money into the the account type: person_1.deposit(amount)

  To withdraw money from the account type: person_1.withdraw(amount: amount, pin: pin_code, account: account_1, atm: atm_1)

  To set new pin code into the account type: account_1.set_pin

  To deactivate acount type: account_1.deactivate

Acknowledgements

  Used course material
  https://learn.craftacademy.co/courses/enrolled/645199

  Craft Academy Cohort 2021

Updates/Improvement plan







USER STORIES
As a user 

I would like to be able to either withdraw money from my account/card 
The ATM needs to have funds.	

As a user
In order to know if my withdrawl was successful or unsuccessful
I want to recieve a message with my withdrawl details

As an ATM operator 
In order for the right person to make a withdrawl
I want each person to have a separate account

As a Customer

To keep my funds secure
I want a secure Pin code & an expiry date on my card that allows only me access to my funds.

As a Bank Costumer
In order to withdraw funds in even amounts.
I want to receive funds in 5,10, 20$ bills

As a Customer
In order to manage my funds
I need a personal account.

As an ATM operator
In order to keep track of our customers
we want to assign each account to a separate person


As a user I would like to be able to check my balance on my card/account.

