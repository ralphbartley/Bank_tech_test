require 'reporting'

describe Reporting do

  describe '.statement' do

    it 'prints the ledger contents in a date, credit, debit, balance column table' do

      expect { @bank.statement }.to output(output).to_stdout
    end
  end
end
