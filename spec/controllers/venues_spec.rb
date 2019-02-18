require 'rails_helper'

RSpec.describe Api::V1::VenuesController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'orders venues by id' do
      Venue.create(name: 'Venue1', address: 'Address1')
      Venue.create(name: 'Venue2', address: 'Address2')
      get :index
      venues = JSON.parse(response.body)
      expect(venues[0]['name']).to eq('Venue1')
    end

    it 'returns all objects' do
      5.times do
        Venue.create(name: 'Venue1', address: 'Address1')
      end

      get :index

      venues = JSON.parse(response.body)
      expect(venues.count).to eq(5)
    end
  end
end
