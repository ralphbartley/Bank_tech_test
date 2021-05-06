class Reporting

  def self.format(ledger)
    puts 'date || credit || debit || balance'
    ledger.records.each do |entry|
      output = "#{entry[0]} || #{entry[1]} || #{entry[2]} || #{format('%.2f', entry[3])}"
      puts output.gsub('-', '/')
    end
  end

end
