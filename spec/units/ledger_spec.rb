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

    it 'updates balance after a transaction' do
      expect().to eq(2000.00)
    end

    it 'stores the transaction and subsequent balance in the record' do
      expect().to eq('1000.00')
    end
  end


end
