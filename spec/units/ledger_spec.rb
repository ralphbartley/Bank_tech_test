require 'ledger'

# mock some transactions
describe Ledger do
  before(:each) do
    @ledger = Ledger.new
  end

  describe '.initialize' do
    it 'starts with an empty collection of records' do
      expect(@ledger.records).to eq([])
    end
  end

  describe '.balance' do
    it 'starts at zero' do
      expect(@ledger.balance).to eq(0)
    end
  end

  describe '.record' do

    it 'updates balance after recording a transaction' do
      transaction = instance_double('Transaction')
      allow(transaction).to receive(:record).and_return( { deposit_amount: 1000 })
      @ledger.record(transaction)
      expect(@ledger.balance).to eq(1000.00)
    end

    it 'stores the transaction in the records' do
      transaction = instance_double('Transaction')
      allow(transaction).to receive(:record).and_return( { deposit_amount: 1000 })
      @ledger.record(transaction)
      expect(@ledger.records).to include( { transaction: transaction, balance: @ledger.balance })
    end
  end


end
