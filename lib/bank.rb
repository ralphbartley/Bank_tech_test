require 'date'

class Bank

  attr_reader :balance, :ledger

  def initialize()
    @balance = 0
    @ledger = []
  end

  def deposit(amount)
    @balance += amount
    @ledger << [DateTime.now.to_date, amount, nil, @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @ledger << [DateTime.now.to_date, nil, amount, @balance]
  end

  def statement()
    puts "date || credit || debit || balance"
    @ledger.each do |entry|
      output = "#{entry[0]} || #{entry[1]} || #{entry[2]} || #{entry[3]}"
      puts output.gsub("-", "/")
    end
  end

end
