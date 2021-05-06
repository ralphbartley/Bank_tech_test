require 'reporting'

describe Reporting do

  describe '.statement' do

    it 'labels the ledger contents in a date, credit, debit, balance column table' do
      output = "date || credit || debit || balance\n"
      ledger = instance_double("Ledger")
      allow(ledger).to receive(:records)
      allow(ledger.records).to receive(:reverse_each)
      expect { Reporting.format_records(ledger) }.to output(output).to_stdout
    end
  end
end
