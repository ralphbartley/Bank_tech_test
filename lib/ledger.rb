class Ledger
  attr_reader :balance, :records

  def initialize
    @records = []
    @balance = 0
  end

  def record(transaction)
    if transaction.record[:deposit_amount] != nil
      @balance += transaction.record[:deposit_amount]
    elsif transaction.record[:withdraw_amount] != nil
      @balance -= transaction.record[:withdraw_amount]
    end
    @records << { transaction: transaction, balance: @balance }
  end

end
