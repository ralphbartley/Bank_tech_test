# How to use:
Clone this repo, then run in IRB using the following as a guide:
```
% irb
> require './lib/bank.rb'
> bank = Bank.new()
> bank.deposit(1000)
> bank.deposit(1000)
> bank.withdraw(500)
> bank.statement
```
Date is the day that the deposit or withdrawal happens, so today.  I would add a configurable date if it mattered.

# How I built this:

1. Outlined the challenge requirements loosely, determining there to be three functions to meet the acceptance criteria.
    * Bank class with Deposit, Withdraw, Statement using balance, amount, ledger, and date.
2. Installed testing gems rspec, simplecov, and rubocop.
3. Decided further modelling not needed and the following steps seem a logical approach:
  1. Start with an empty balance
        * I probably strictly don't need balance for the simplest implementation as I could iterate through the ledger, but I'm going to keep it.
  2. Add money with a deposit, updating balance
  3. Store the deposit transaction, with date
  4. Subtract money with a withdrawal, updating balance
  5. Store the withdrawal transaction, with date
  6. Print transaction history statement with formatting (with how ledger is being implemented as I go I have split this into another step)
        * First add balance into the ledger each time, as well as transaction type using ledger entry index.
  g. Be able to set the date so that the acceptance criteria can be reproduced (probably not necessary?)
4. I keep a list of refactor ideas as I go
    * add ledger update method for deposit and withdraw to use
    * add Account, Ledger, and Reporting class
