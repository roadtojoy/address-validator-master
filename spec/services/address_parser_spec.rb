require 'rails_helper'

describe "AddressParser" do
  context 'missing elements' do
    it 'returns nil' do
      params =
        {
          street_address: '',
          city: '',
          state: '',
          zip_code: nil
        }
      expect(AddressParser.new(params).parse).to be(nil)
    end
  end
  context 'invalid address' do
    it 'returns nil' do
      params =
        {
          street_address: '123 Any St',
          city: 'Cityville',
          state: 'State',
          zip_code: 10000
        }
      expect(AddressParser.new(params).parse).to be(nil)
    end
  end

  context 'valid address' do
      let(:valid_params) {
        {
          street_address: '1600 Pennsylvania Avenue NW',
          city: 'Washington',
          state: 'DC',
          zip_code: '20500'
        }
      }
    it 'creates a new address model with the house number saved' do
      expect(AddressParser.new(valid_params).parse.house_number).to eq '1600'
    end
  end
end

