require 'oyster_card'

RSpec.describe OysterCard do
 context 'new default state' do
   it 'has a default balance of 0' do
     expect(subject.balance).to eq (0)
   end
 end

  describe '#top_up' do
    it 'can be topped up by 10' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'has a maximum balance' do
      bal = OysterCard::MAXIMUM_BALANCE
      expect { subject.top_up(100) }.to raise_error "Maximum balance is £#{bal}."
    end
  end

    describe '#deduct' do
      before { subject.top_up(10) }
      it 'can have money deducted' do
        expect { subject.deduct(2) }.to change { subject.balance }.by(-2)
      end
    end

    describe '#in_journey?' do
      it 'initialy is not in a journey' do
        expect(subject).not_to be_in_journey
      end
    end

    it 'does not allow touch in if balance is less than minimum balance' do
      error = "Insuficient funds to start journey."
      expect { subject.touch_in }.to raise_error error
    end

    describe '#touch_in' do
      before { subject.top_up(10) }
      it 'starts a journey' do
        subject.touch_in
        expect(subject).to be_in_journey
      end
    end


    describe '#touch_out' do
      before { subject.top_up(10) }
      it 'ends a journey' do
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it 'deducts the correct fare for the journey' do
        expect { subject.touch_out }.to change { subject.balance }.by(-OysterCard::FARE)
      end
    end

end
