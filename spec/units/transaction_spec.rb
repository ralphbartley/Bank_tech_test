require 'transaction'

# mock a Ledger?

describe Transaction do

  describe '.initialize' do

    it 'creates a record for a deposit' do
      transaction = Transaction.new(1000, 'deposit')
      expect(transaction.record).to include(deposit_amount: 1000)
    end

    it 'creates a record for a withdrawal' do
      transaction = Transaction.new(1000, 'withdraw')
      expect(transaction.record).to include(withdraw_amount: 1000)
    end
  end
end
