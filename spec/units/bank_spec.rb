# frozen_string_literal: true

require 'bank'

describe Bank do

  describe '.initialize' do
    it 'starts with a Ledger' do
      @bank = Bank.new
      expect(@bank.ledger).to be_a Ledger
    end
  end

  describe '.withdraw' do
    before(:each) do
      @count = 0
      @ledger = instance_double("Ledger")
      allow(@ledger).to receive(:record)
      @transaction = instance_double("Transaction")
      allow(Transaction).to receive(:new) do
        @count += 1
        @transaction
      end
      @bank = Bank.new(@ledger)
      @bank.deposit(1000)
    end

    it 'creates a transaction' do
      expect(@count).to eq 1
    end

    it 'adds a withdrawal transaction to the ledger' do
      expect(@ledger).to have_received(:record)
    end
  end

  describe '.deposit' do
    before(:each) do
      @count = 0
      @ledger = instance_double("Ledger")
      allow(@ledger).to receive(:record)
      @transaction = instance_double("Transaction")
      allow(Transaction).to receive(:new) do
        @count += 1
        @transaction
      end
      @bank = Bank.new(@ledger)
      @bank.deposit(1000)
    end

    it 'adds a deposit transaction to the ledger' do
      expect(@ledger).to have_received(:record)
    end

    it 'creates a transaction' do
      expect(@count).to eq 1
    end
  end

  describe '.statement' do
    # mock
    it 'prints a formatted ledger history' do

    end
  end

end
