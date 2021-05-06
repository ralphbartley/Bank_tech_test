require 'date'

class Ledger
  attr_reader :balance

  def initialize
    @records = []
    @balance = 0
  end

  def record(transaction)

  end

end
