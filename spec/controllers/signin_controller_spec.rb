require 'rails_helper'

RSpec.describe SigninController, type: :controller do
  describe 'POST  /signin' do
    before do
      Venue.create(email: 'Email1', password: 'Password1')
    end

    it 'returns http success' do
      post :create, params: { venue: { email: 'Email1', password: 'Password1' } }
      expect(response).to have_http_status(:success)
    end

    it 'returns 404 if the credentials are incorrect' do
      post :create, params: { venue: { email: 'Email1', password: 'Password123' } }
      expect(response).to have_http_status(404)
    end
  end
end
