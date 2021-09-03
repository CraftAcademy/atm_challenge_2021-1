<h1>ReadMe</h1>

<h2>The Code</h2>
This code has been written to simulate a virtual ATM, simulating the machine, an account on it, and a user interacting with the ATM.

<h2>Dependencies </h2>
The dependencies are as follows:
  RSPEC
  PRY
  
<h2>Setup</h2>
Launch irb

load './src/person.rb'
load './src/account.rb'
load './src/atm.rb'

<h2>Instructions</h2>
To create a new instance of the Person Class type: person_1 = Person.new(name: 'name') <br>

To create a new instance of the Account Class type: account_1 = Account.new(owner: person_1)

To create a new instance of the ATM Class type: atm_1 = Atm.new

To give person_1 an account type: person_1.create_account

To see full list of attributes type: person_1

To deposit money into the the account type: person_1.deposit(amount)

To withdraw money from the account type: person_1.withdraw(amount: amount, pin: pin_code, account: account_1, atm: atm_1)

To set new pin code into the account type: account_1.set_pin

To change status of account type: account_1.change_account_status

<h2>Acknowledgements</h2>
Course material at:
https://learn.craftacademy.co/courses/enrolled/645199

Craft Academy Cohort 2021

<h2>License</h2>
MIT License
