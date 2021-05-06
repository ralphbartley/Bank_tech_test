require 'bank'


describe Bank do
  before(:each) do
    @bank = Bank.new
    @bank.deposit(1000)
  end

  describe '.withdraw' do
    # with no mocking this has to go from Bank -> Transaction -> Ledger
    @bank.withdraw(500)
    expect(@bank.ledger.balance).to eq(500)
  end

  describe '.deposit' do
    # with no mocking this has to go from Bank -> Transaction -> Ledger
    expect(@bank.ledger.balance).to eq(1000)
  end

  describe '.statement' do
    # with no mocking this has to go from Bank -> Transaction -> Ledger -> Reporting
    # is this history printing incorrectly? should be latest first, use array.reverse_each
    @bank.withdraw(500)
    date = DateTime.now.to_date.gsub('-', '/')
    output = "date || credit || debit || balance\n
              #{date} || 1000.00 ||  || 1000.00\n
              #{date} ||  || 500.00 || 500.00\n"
    expect { @bank.statement }.to output(output).to_stdout
  end

end
