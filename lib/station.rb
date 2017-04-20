require_relative 'oyster_card'

class Station
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
