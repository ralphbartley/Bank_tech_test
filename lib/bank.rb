# frozen_string_literal: true

require 'date'

class Bank
  attr_reader :balance, :ledger

  def initialize
    @balance = 0
    @ledger = []
  end

  def deposit(amount)
    @balance += amount
    @ledger << [DateTime.now.to_date, format('%.2f', amount), nil, @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @ledger << [DateTime.now.to_date, nil, format('%.2f', amount), @balance]
  end

  def statement
    puts 'date || credit || debit || balance'
    @ledger.each do |entry|
      output = "#{entry[0]} || #{entry[1]} || #{entry[2]} || #{format('%.2f', entry[3])}"
      puts output.gsub('-', '/')
    end
  end
end
