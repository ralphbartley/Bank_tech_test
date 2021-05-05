require 'bank'

describe Bank do

  before(:each) do
    @bank = Bank.new()
  end

  describe '.ledger' do
    it 'starts as an empty collection' do
      expect(@bank.ledger).to eq([])
    end
  end

  describe '.balance' do
    it 'starts at zero' do
      expect(@bank.balance).to eq(0)
    end
  end

  describe '.deposit' do
    it 'adds money to balance' do
      @bank.deposit(1000)
      expect(@bank.balance). to eq(1000)
    end

    it 'stores the date of the deposit' do
      @bank.deposit(1000)
      expect(@bank.ledger.first).to eq([1000, DateTime.now.to_date])
    end
  end



end
