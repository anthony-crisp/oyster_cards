#
class OysterCard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  FARE = 2

  attr_reader :balance
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(credit)
    message = "Maximum balance is £#{MAXIMUM_BALANCE}."
    raise message if (@balance + credit) > MAXIMUM_BALANCE
    @balance += credit
  end

  def deduct(fare)
    @balance -= fare
  end

  private :deduct

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Insuficient funds to start journey.' if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(FARE)
    @in_journey = false
  end
end
