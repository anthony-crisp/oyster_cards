require_relative 'station'

class Journey
  attr_accessor :entry_station, :in_journey

  def initialize(entry_station)
    @entry_station = entry_station
    @in_journey = false
  end

  private

  def in_journey?
    @in_journey
  end
end
