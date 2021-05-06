class Transaction

  attr_reader :record

  def initialize(amount, type)
    @record = {
      date: DateTime.now.to_date,
      deposit_amount: nil,
      withdraw_amount: nil,
    }
    if type == 'deposit'
      @record[:deposit_amount] = amount
    elsif type == 'withdraw'
      @record[:withdraw_amount] = amount
    end
  end

end
