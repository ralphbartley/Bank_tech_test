# frozen_string_literal: true

require 'bank'

describe Bank do
  before(:each) do
    @bank = Bank.new
  end

  describe '.initialize' do
    it 'starts with a Ledger' do
      expect(@bank.ledger).to be_a Ledger
    end
  end

  describe '.withdraw' do
    it 'removes an amount from the bank account' do

    end

    it 'is recorded in the ledger' do

    end
  end

  describe '.deposit' do
    before(:each) do
      @bank.deposit(1000)
    end

    it 'adds an amount to the bank account' do
      expect(@bank.ledger.balance).to eq(1000)
    end

    it 'is recorded in the ledger' do
      expect(@bank.ledger.recor
    end
  end

  describe '.statement' do
    # mock
    it 'prints a formatted ledger history' do

    end
  end

end
