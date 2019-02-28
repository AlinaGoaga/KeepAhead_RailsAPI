require 'rails_helper'

RSpec.describe SignupController, type: :controller do
  describe 'POST  /api/v1/venues' do
    it 'returns http success' do
      allow_any_instance_of(SignupController).to receive(:find_address).and_return('Address1')
      post :create, params: { venue: { name: 'Venue1', address: 'Address1', email: 'Email1', password: 'Password1', lattitude: 1, longitude: 2 } }
      expect(response).to have_http_status(:success)
    end
  end

  it 'creates a venue' do
    allow_any_instance_of(SignupController).to receive(:find_address).and_return('Address1')
    post :create, params: { venue: { name: 'Venue1', address: 'Address1', email: 'Email1', password: 'Password1', lattitude: 1, longitude: 2 } }
    expect(Venue.find_by(name: 'Venue1')).to be
  end
end
