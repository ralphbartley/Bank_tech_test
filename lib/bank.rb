require 'ledger'
require 'transaction'

class Bank
  attr_reader :ledger

  def initialize(ledger = Ledger.new)
    @ledger = ledger
  end

  def deposit(amount)
    post_transaction(amount, "deposit")
  end

  def withdraw(amount)
    post_transaction(amount, "withdraw")
  end

  def statement
    puts Reporting.format(@ledger)
  end

private

  def post_transaction(amount, type)
    transaction = Transaction.new(amount, type)
    @ledger.record(transaction)
  end

end
