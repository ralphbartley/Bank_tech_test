require 'ledger'

# mock some transactions
describe Ledger do

  describe '.initialize' do
    it 'starts with an empty collection' do
      expect().to eq([])
    end
  end

  describe '.balance' do
    it 'starts at zero' do
      expect().to eq(0)
    end
  end

  describe '.record' do

    it 'updates balance after recording a transaction' do
      ledger = Ledger.new
      transaction = instance_double('Transaction')
      allow(transaction).to receive(:record).and_return( { deposit_amount: 1000 })
      ledger.record(transaction)
      expect(ledger.balance).to eq(1000.00)
    end

    it 'stores the transaction in the records' do
      ledger = Ledger.new
      transaction = instance_double('Transaction')
      allow(transaction).to receive(:record).and_return( { deposit_amount: 1000 })
      ledger.record(transaction)
      expect(ledger.records).to include( { transaction: transaction, balance: ledger.balance })
    end
  end


end
