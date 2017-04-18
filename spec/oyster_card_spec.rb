require 'oyster_card'

RSpec.describe OysterCard do
 context 'default' do
   it 'has a default balance of 0' do
     expect(subject.balance).to eq (0)
   end
 end

  describe '#top_up' do
    it 'can be topped up by 10' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'has a maximum balance' do
      expect { subject.top_up(100) }.to raise_error "Maximum balance is £90."
    end
  end

end
