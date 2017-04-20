require 'oyster_card'

RSpec.describe OysterCard do

subject(:oystercard) { described_class.new }

let(:station) {double :station}

  it 'initializes with a balance of 0' do
  expect(subject.balance).to eq(0)
  end

describe '#top_up' do
  it 'can be topped up by 10' do
  expect{ subject.top_up(10) }.to change{ subject.balance }.by 10
  end
end

it 'has a maximum balance' do
  bal = OysterCard::MAXIMUM_BALANCE
  message = "Maximum balance is £#{bal}."
  expect { subject.top_up(100) }.to raise_error message
end

  it 'does not allow touch in if balance is less than minimum balance' do
    error = 'Insuficient funds to start journey.'
    expect { subject.touch_in(station) }.to raise_error error
  end

  describe '#touch_in' do
    before { subject.top_up(10) }


    it 'deducts the correct fare for the journey' do
      fare = OysterCard::MINIUM_FARE
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-fare)
    end
  end
end
