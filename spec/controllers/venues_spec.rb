# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::VenuesController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'orders venues by id' do
      Venue.create(name: 'Venue1', address: 'Address1', email: 'Email1', password: 'Password1')
      Venue.create(name: 'Venue2', address: 'Address2', email: 'Email2', password: 'Password2')
      get :index
      venues = JSON.parse(response.body)
      expect(venues[0]['name']).to eq('Venue1')
      expect(venues[0]['address']).to eq('Address1')
      expect(venues[0]['email']).to eq('Email1')
      expect(venues[0]['password']).to eq('Password1')
      expect(venues[1]['name']).to eq('Venue2')
      expect(venues[1]['address']).to eq('Address2')
      expect(venues[1]['email']).to eq('Email2')
      expect(venues[1]['password']).to eq('Password2')
    end

    it 'returns all objects' do
      5.times do
        Venue.create(name: 'Venue1', address: 'Address1', email: 'Email1', password: 'Password1')
      end

      get :index

      venues = JSON.parse(response.body)
      expect(venues.count).to eq(5)
    end
  end

  describe 'POST/' do
    it 'receives lat and long' do
      # post :create, params: { location: { lat: '51.52', long: '-0.07' } }
      # user_location = JSON.parse(response.body)
      # # expect(user_location['lat']).to eq('51.52')
      # expect(user_location['long']).to eq('-0.07')
    end
  end
end
