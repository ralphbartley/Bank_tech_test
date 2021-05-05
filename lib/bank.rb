class Bank

  attr_reader :balance, :ledger

  def initialize()
    @balance = 0
    @ledger = []
  end

  def deposit(amount)
    @balance += amount
    @ledger << [amount, DateTime.now.to_date]
  end

end
