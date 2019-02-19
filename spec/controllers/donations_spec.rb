require 'rails_helper'

RSpec.describe Api::V1::DonationsController do
  # describe 'GET #index' do
  #   it 'returns http success' do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  describe 'Donations' do
    it 'returns all objects' do
      venue = Venue.create(name: 'Venue1', address: 'Address1')
      
      post :create, params: { venue_id: venue.id, donation: {amount: 10, passphrase: "Enjoy"} }
      
      expect(Donation.find_by(passphrase: "Enjoy")).to be

    end

    # it 'returns all objects' do
    #   5.times do
    #     Venue.create(name: 'Venue1', address: 'Address1')
    #   end

    #   get :index

    #   venues = JSON.parse(response.body)
    #   expect(venues.count).to eq(5)
    # end
    
  end
end
