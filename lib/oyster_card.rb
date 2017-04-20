require_relative 'station'
require_relative 'journey'

class OysterCard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIUM_FARE = 2

  attr_reader :balance
  attr_accessor :in_journey

  def initialize
    @balance = 0
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

  def stations
    @stations = Station.new
  end

  def touch_in(station)
    raise 'Insuficient funds to start journey.' if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIUM_FARE)
    @in_journey = false
    @exit_station = station
  end
end
