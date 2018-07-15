require 'rails_helper'

RSpec.describe AddressesController, :type => :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) {
        {
          street_address: '1600 Pennsylvania Avenue NW',
          city: 'Washington',
          state: 'DC',
          zip_code: '20500'
        }
      }
      before do
        post 'create', params: valid_params
      end
      it 'creates a new address model with the house number saved' do
        expect(assigns(:address).house_number).to eq '1600'
      end

      it 'creates a new address model with the street name saved' do
        expect(assigns(:address).street_name).to eq 'Pennsylvania'
      end

      it 'creates a new address model with the street name saved' do
        expect(assigns(:address).street_type).to eq 'Ave'
      end

      it 'creates a new address model with the street post direction saved' do
        expect(assigns(:address).street_postdirection).to eq 'NW'
      end

      it 'creates a new address model with the city saved' do
        expect(assigns(:address).city).to eq 'Washington'
      end

      it 'creates a new address model with the state saved' do
        expect(assigns(:address).state).to eq 'DC'
      end

      it 'creates a new address model with the zip_5 saved' do
        expect(assigns(:address).zip_5).to eq '20500'
      end
    end

    context 'with invalid params' do
      let(:invalid_params) {
        {
          street_address: nil,
          city: nil,
          state: nil,
          zip_code: '10000'
        }
      }

      it "does not save the new address" do
        expect{
          post :create, params: invalid_params
        }.to_not change(Address, :count)
      end
    end
  end
end
