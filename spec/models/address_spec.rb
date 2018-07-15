require 'rails_helper'

RSpec.describe Address, :type => :model do
  describe '#new' do
    context 'Given a valid address' do
      it 'can create a new address' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 20500
                        )).to be_valid
      end
    end

    context 'Given bad address values' do
      it 'cannot create a new address' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 123
                        )).not_to be_valid
      end
    end

    context 'Missing required attributes' do
      it 'cannot create a new address without a house_number' do
        expect(Address.new(
                          house_number: nil,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 123
                        )).not_to be_valid
      end
      it 'cannot create a new address without a street_name' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: nil,
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 123
                        )).not_to be_valid
      end
      it 'cannot create a new address without a city' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: nil,
                          state: 'DC',
                          zip_5: 123
                        )).not_to be_valid
      end
      it 'cannot create a new address without a state' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: nil,
                          zip_5: 123
                        )).not_to be_valid
      end
      it 'cannot create a new address without a zip_5' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: nil
                        )).not_to be_valid
      end
    end

    describe '#to_s' do
      let(:address) { create(:address_ny) }
      it 'prints out the address components needed for mailing together as a string' do
        expect(address.to_s).to eq('129 W 81st St Apt 5A, New York, NY 10024')
      end

      it 'prints out correctly when not all address elements are present' do
        expect(Address.new(
                          house_number: 123,
                          street_name: 'Any',
                          street_type: 'Street',
                          city: 'Beverly Hills',
                          state: 'CA',
                          zip_5: 90210
        ).to_s).to eq('123 Any Street, Beverly Hills, CA 90210')
      end
    end
  end

  describe 'self.states' do
    it 'contains 51 states' do
      expect(Address.states.length).to eq(51)
    end
  end
end
