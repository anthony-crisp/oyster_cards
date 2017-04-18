class OysterCard

MAXIMUM_BALANCE = 90

attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(credit)
    fail "Maximum balance is £#{MAXIMUM_BALANCE}." if (@balance + credit) >= MAXIMUM_BALANCE
    @balance += credit
  end

  def deduct(debit)
    @balance -= debit
  end

end
