How to use:


How I built this:

1. Outlined the challenge requirements loosely, determining there to be three functions to meet the acceptance criteria.
  - Bank class with Deposit, Withdraw, Statement using balance, amount, ledger, and date.
2. Installed testing gems rspec, simplecov, and rubocop.
3. Decided further modelling not needed and the following steps seem a logical approach:
  a. Start with an empty balance
    - I probably strictly don't need balance for the simplest implementation as I could iterate through the ledger, but I'm going to keep it.
  b. Add money with a deposit, updating balance
  c. Store the deposit transaction, with date
  d. Subtract money with a withdrawal, updating balance
  e. Store the withdrawal transaction, with date
  f. Print transaction history statement with formatting (with how ledger is being implemented as I go I have split this into another step)
    - First add balance into the ledger each time, as well as transaction type using ledger entry index.
  g. Be able to set the date so that the acceptance criteria can be reproduced (probably not necessary?)
4. I keep a list of refactor ideas as I go
  - add ledger update method for deposit and withdraw to use
  - add Account, Ledger, and Reporting class
