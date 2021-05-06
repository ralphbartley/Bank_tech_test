require 'reporting'

describe Reporting do

  describe '.statement' do

    it 'labels the ledger contents in a date, credit, debit, balance column table' do
      #intentional line break to make test work on puts output
      output = 'date || credit || debit || balance
'
      ledger = instance_double("Ledger")
      allow(ledger).to receive(:records)
      allow(ledger.records).to receive(:each)
      expect { Reporting.format(ledger) }.to output(output).to_stdout
    end
  end
end

output = 'date || credit || debit || balance'
