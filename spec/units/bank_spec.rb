require 'bank'

describe Bank do

  before(:each) do
    @bank = Bank.new()
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
  end

end
