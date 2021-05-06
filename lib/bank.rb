require 'ledger'

class Bank
  attr_reader :ledger

  def initialize(ledger = Ledger.new)
    @ledger = ledger
  end

  def deposit(amount)
    transaction = Transaction.new(amount, "deposit")
    @ledger.record(transaction)
  end

  def withdraw(amount)
    transaction = Transaction.new(amount, "withdraw")
    @ledger.record(transaction)
  end

  def statement

  end

private

  def post_transaction(amount)

  end

end
