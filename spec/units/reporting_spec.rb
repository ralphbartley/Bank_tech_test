require 'reporting'

describe Reporting do

  describe '.statement' do

    it 'prints the ledger contents in a date, credit, debit, balance column table' do
      output = "date || credit || debit || balance\n
                2021/05/05 || 1000.00 ||  || 1000.00\n
                2021/05/05 ||  || 500.00 || 500.00\n"
      expect { @bank.statement }.to output(output).to_stdout
    end
  end
end
