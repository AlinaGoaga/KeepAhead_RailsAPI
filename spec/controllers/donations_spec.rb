# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DonationsController do
  describe 'GET #index' do
    it 'returns http success' do
      venue = Venue.create(name: 'Venue1', address: 'Address1')
      get :index, params: { venue_id: 1 }
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'POST /venues/:venue_id/donations' do
  #   it 'creates a donation' do
  #     venue = Venue.create(name: 'Venue2', address: 'Address2')
  #     post :create, params: { venue_id: venue.id, donation: { amount: 10, passphrase: 'Enjoy' } }
  #     expect(Donation.find_by(passphrase: 'Enjoy')).to be
  #   end
  # end
end
