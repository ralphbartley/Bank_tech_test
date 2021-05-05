class Bank

  attr_reader :balance, :ledger

  def initialize()
    @balance = 0
    @ledger = []
  end

  def deposit(amount)
    @balance += amount
    @ledger << [DateTime.now.to_date, amount, nil, @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @ledger << [DateTime.now.to_date, nil, amount, @balance]
  end

end
