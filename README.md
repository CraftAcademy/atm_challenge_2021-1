<h1>ReadMe</h1>

<h2>The Code</h2>
This code has been written to simulate a virtual ATM, simulating the machine, an account on it, and a user interacting with the ATM.

<h2>Dependencies 
The dependencies are as follows:
  RSPEC
  PRY
  
<h2>Setup</h2>
Launch irb

load './src/person.rb'
load './src/account.rb'
load './src/atm.rb'


<h2>Instructions</h2>
1. To create a new instance of the Person Class type: person_1 = Person.new(name: 'name')
2. To create a new instance of the Account Class type: account_1 = Account.new(owner: person_1)
3. To create a new instance of the ATM Class type: atm_1 = Atm.new
4. To give person_1 an account type: person_1.create_account   

  To see full list of attributes type: person_1 

  To deposit money into the the account type: person_1.deposit(amount)

  To withdraw money from the account type: person_1.withdraw(amount: amount, pin: pin_code, account: account_1, atm: atm_1)

  To set new pin code into the account type: account_1.set_pin

  To deactivate acount type: account_1.deactivate

<h2>Acknowledgements</h2>

  Used course material
  https://learn.craftacademy.co/courses/enrolled/645199

  Craft Academy Cohort 2021

<h2>Updates/Improvement plan</h2>







<h2>USER STORIES</h2>
As a Customer
I would like to be able to either withdraw money from my account/card 
The ATM needs to have funds.	

As a Customer
In order to know if my withdrawl was successful or unsuccessful
I want to recieve a message with my withdrawl details

As a Customer
To keep my funds secure
I want a secure Pin code & an expiry date on my card that allows only me access to my funds.

As a Costumer
In order to withdraw funds in even amounts.
I want to receive funds in 5,10, 20$ bills

As a Customer
In order to manage my funds
I need a personal account.

As an ATM operator
In order to keep track of our customers
we want to assign each account to a separate person

As an ATM operator 
In order for the right person to make a withdrawl
I want each person to have a separate account


