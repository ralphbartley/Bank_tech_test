require 'bank'

describe Bank do

  describe '.balance' do
    it 'starts at zero' do
      bank = Bank.new()
      expect(bank.balance).to eq(0)
    end
  end

end
