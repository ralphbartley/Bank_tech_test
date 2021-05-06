class Reporting

  def self.format_records(ledger)
    puts "date || credit || debit || balance"
    ledger.records.reverse_each do |entry|
      date = entry[:transaction].record[:date]
      deposit = entry[:transaction].record[:deposit_amount]
      deposit = format('%.2f', deposit) if deposit != nil
      withdraw = entry[:transaction].record[:withdraw_amount]
      withdraw = format('%.2f', withdraw) if withdraw != nil
      balance = format('%.2f', entry[:balance])
      output = "#{date} || #{deposit} || #{withdraw} || #{balance}"
      puts output.gsub('-', '/')
    end
  end
end
