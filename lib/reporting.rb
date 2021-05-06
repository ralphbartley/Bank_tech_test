class Reporting

  def self.format(ledger)
    puts 'date || credit || debit || balance'
    ledger.records.each do |entry|
      puts entry[:balance]
      output = "#{entry[:transaction].record[:date]} ||
                #{entry[:transaction].record[:deposit_amount]} ||
                #{entry[:transaction].record[:withdraw_amount]}] ||
                #{format('%.2f', entry[:balance])}"
      puts output.gsub('-', '/')
    end
  end

end
