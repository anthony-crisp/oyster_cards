require 'station'
require 'oyster_card'

RSpec.describe Station do
  let(:station) { described_class.new('Aldgate East') }

  it 'has the name "Aldgate East"' do
    expect(station.name).to eq 'Aldgate East'
  end
end
