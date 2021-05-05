# frozen_string_literal: true

require 'bank'

describe Bank do
  before(:each) do
    @bank = Bank.new
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
    before(:each) do
      @bank.deposit(1000)
    end

    it 'adds money to balance' do
      expect(@bank.balance).to eq(1000)
    end

    it 'stores the date of the deposit' do
      expect(@bank.ledger[0][0]).to eq(DateTime.now.to_date)
    end

    it 'stores the type of transaction in the record' do
      expect(@bank.ledger[0][1]).to eq(1000)
    end

    it 'stores the balance after the deposit' do
      @bank.deposit(1000)
      expect(@bank.ledger[1][3]).to eq(2000)
    end
  end

  describe '.withdraw' do
    before(:each) do
      @bank.deposit(1000)
      @bank.withdraw(500)
    end

    it 'subtracts money from balance' do
      expect(@bank.balance).to eq(500)
    end

    it 'stores the date of the deposit' do
      expect(@bank.ledger[1][0]).to eq(DateTime.now.to_date)
    end

    it 'stores the type of transaction in the record' do
      expect(@bank.ledger[1][2]).to eq(500)
    end

    it 'stores the balance after the withdrawal' do
      expect(@bank.ledger[1][3]).to eq(500)
    end
  end

  describe '.statement' do
    before(:each) do
      @bank.deposit(1000)
      @bank.withdraw(500)
    end

    it 'prints the ledger contents in a date, credit, debit, balance column table' do
      output = "date || credit || debit || balance\n2021/05/05 || 1000 ||  || 1000\n2021/05/05 ||  || 500 || 500\n"
      expect { @bank.statement }.to output(output).to_stdout
    end
  end
end
