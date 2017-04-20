require 'journey'

RSpec.describe Journey do
  #subject(:new_journey) { described_class.new }
  #let(:oystercard) { double(:oystercard, top_up: 10) }
  let(:entry_station) { double :entry_station, name: 'Aldgate East'}

  it 'creates a new journey' do
    expect(described_class.new(entry_station)).to be_a(Journey)
  end

  it 'checks that a new journey stores the entry station' do
    journey = described_class.new("station")
    expect(journey.entry_station).to eq "station"
  end

end
