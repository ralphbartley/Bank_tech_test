require_relative '../../lib/bank.rb'


describe Bank do
  before(:each) do

  end

  describe '.withdraw' do
    # with no mocking this has to go from Bank -> Transaction -> Ledger

    it 'removes money from the account' do
      @bank = Bank.new
      @bank.deposit(1000)
      @bank.withdraw(500)
      expect(@bank.ledger.balance).to eq(500)
    end

  end

  describe '.deposit' do
    # with no mocking this has to go from Bank -> Transaction -> Ledger

    it 'adds money to the account' do
      @bank = Bank.new
      @bank.deposit(1000)
      expect(@bank.ledger.balance).to eq(1000)
    end
  end

  describe '.statement' do
    # with no mocking this has to go from Bank -> Transaction -> Ledger -> Reporting
    # is this history printing incorrectly? should be latest first, use array.reverse_each

    it 'prints out a formatted statement of all transactions' do
      @bank = Bank.new
      @bank.deposit(1000)
      @bank.withdraw(500)
      date = DateTime.now.to_date.to_s.gsub('-', '/')
      output = "date || credit || debit || balance\n
               #{date} ||  || 500.00 || 500.00\n
               #{date} || 1000.00 ||  || 1000.00\n"
      expect { @bank.statement }.to output(output).to_stdout
    end
  end

end
