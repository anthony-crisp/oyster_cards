class OysterCard

MAXIMUM_BALANCE = 90

attr_reader :balance
attr_accessor :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(credit)
    fail "Maximum balance is £#{MAXIMUM_BALANCE}." if (@balance + credit) > MAXIMUM_BALANCE
    @balance += credit
  end

  def deduct(debit)
    @balance -= debit
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
  

end
