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

If you want to run rspec, simplecov, or rubocop then do:

```
% bundle install
% rspec #runs simplecov too
% rubocop
```

# How I built this (stream-of-development):

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
    7. Be able to set the date so that the acceptance criteria can be reproduced (probably not necessary?)
4. I keep a list of refactor ideas as I go
    * add ledger update method for deposit and withdraw to use
    * add Account, Ledger, and Reporting class
5. Okay a full on refactor then... lets add those three classes and one more. It became apparent that Account or Ledger would be doing too much if they handled deposit/withdrawal.
    * Account
        - has a balance
        - has a Ledger
    * Transaction
        - has a record with amount, date, and type (withdrawal or deposit)
    * Ledger
        - has collection of transaction objects, a balance, and a record(transaction)
    * Reporting
        - formats a ledger's records
    * Bank
        - Now a controller class, accepts deposit & withdrawal which are passed on to Transactions, or statement which gets a formatted complete ledger history from Reporting
        - Transaction added to Ledger via record when deposit or withdrawal are called
            - No error catching since its not specified in the criteria, but if I did do it, then Ledger would do the error handling on transaction success
6. I just divvied up the methods from the Bank class into the 4 new classes roughly.  It has become apparent that the Ledger class should contain the balance of an account and therefore Account is outside the scope of the requirements of this tech test.
7. Now that I've sorted out the logic of my refactor with a quick copy paste and a bit of critical thought, I think to recompose my tests and start the red green cycle over again by doing the same rough chopping up into new spec files.  
    - I noted what technique would be necessary in each spec file; stub or mock.  
    - It also hits me I'm going to need to start at a new feature level test using everything through Bank
        - Unit testing to be done while accomplishing the overall feature tests.
8. In trying to write the tests, specifically mocks or spies, I've determined that since Bank will have deposit and withdraw, then it should create the transaction object and pass it to the ledger.
    - I'm realizing at this point that when I went to do the refactor it would have aided me to re-do the modelling as even just writing the tests is picking up a lot of loose ends.
