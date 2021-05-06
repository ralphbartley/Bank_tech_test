class Reporting

  def format(ledger)
    puts 'date || credit || debit || balance'
    ledger.each do |entry|
      output = "#{entry[0]} || #{entry[1]} || #{entry[2]} || #{format('%.2f', entry[3])}"
      puts output.gsub('-', '/')
    end
  end

end
