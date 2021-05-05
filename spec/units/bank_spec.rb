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

    it 'stores the type of transaction in the record' do
      expect(@bank.ledger[1][2]).to eq("Deposit")
    end

    it 'stores the balance after the deposit' do
      @bank.deposit(1000)
      @bank.deposit(1000)
      expect(@bank.ledger[1][3]).to eq(2000)
    end
  end

  describe '.withdraw' do
    it 'subtracts money from balance' do
      @bank.deposit(1000)
      @bank.withdraw(500)
      expect(@bank.balance).to eq(500)
    end

    it 'stores the date of the deposit' do
      @bank.deposit(1000)
      @bank.withdraw(500)
      expect(@bank.ledger[1][0]).to eq(500)
      expect(@bank.ledger[1][1]).to eq(DateTime.now.to_date)
    end

    it 'stores the type of transaction in the record' do
      @bank.deposit(1000)
      @bank.withdraw(500)
      expect(@bank.ledger[1][2]).to eq("Withdrawal")
    end

    it 'stores the balance after the withdrawal' do
      @bank.deposit(1000)
      @bank.withdraw(500)
      expect(@bank.ledger[1][3]).to eq(500)
    end
  end


end
