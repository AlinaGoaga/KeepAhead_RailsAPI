require 'rails_helper'

RSpec.describe Api::V1::DonationsController do
  describe 'GET #index' do
    it 'returns http success' do
      venue = Venue.create(name: 'Venue1', address: 'Address1')
      get :index, params: { venue_id: 1 }
      expect(response).to have_http_status(:success)
    end
  end

  before do
    @venue = Venue.create(name: 'Venue2', address: 'Address2')
    stripe_customer_mock = double(id: 5)
    allow(Stripe::Customer).to receive(:create).with(source: 'tok_1E8lYo2eZvKYlo2C69rXMvOP', email: 'goaga.alina@gmail.com').and_return(stripe_customer_mock)
    allow(Stripe::Charge).to receive(:create).with(customer: 5, amount: '10', currency: 'GBP')
  end

  describe 'POST /venues/:venue_id/donations' do
    it 'creates a donation' do
      post :create, params: { venue_id: @venue.id, donation: {
        amount: 10, currency: 'GBP', email: 'goaga.alina@gmail.com',
        passphrase: 'Enjoy', token: 'tok_1E8lYo2eZvKYlo2C69rXMvOP'
      } }
      expect(Donation.find_by(passphrase: 'Enjoy')).to be
    end
  end

  describe 'PUT  /api/v1/venues/:venue_id/donations/:id' do
    it 'marks a donation as redeemed' do
      donation = Donation.create(venue: @venue)
      put :update, params: { venue_id: @venue.id, id: donation.id, redeemed: true }
      expect(donation.reload.redeemed).to eq(true)
    end
  end
end
