How to use:


How I built this:

1. Outlined the challenge requirements loosely, determining there to be three functions to meet the acceptance criteria.
  - Bank class with Deposit, Withdraw, Statement using balance, amount, ledger, and date.
2. Installed testing gems rspec, simplecov, and rubocop.
3. Decided further modelling not needed and the following steps seem a logical approach:
  a. Start with an empty balance
  b. Add money with a deposit, updating balance
  c. Store the deposit transaction, with date
  d. Subtract money with a withdrawal, updating balance
  e. Store the withdrawal transaction, with date
  f. Print transaction history statement with formatting
  g. Be able to set the date so that the acceptance criteria can be reproduced
4. I keep a list of refactor ideas as I go
  - add store date method for deposit and withdraw to use
  - add Account and Report class
