require 'rails_helper'

RSpec.describe Api::V1::VenuesController do
  # "[{\"id\":1,\"name\":\"Venue2\",\"address\":\"Address2\",\"created_at\":\"2019-02-10T18:50:30.581Z\",\"updated_at\":\"2019-02-10T18:50:30.581Z\"},{\"id\":2,\"name\":\"Venue1\",\"address\":\"Address1\",\"created_at\":\"2019-02-10T18:50:30.581Z\",\"updated_at\":\"2019-02-10T18:50:30.581Z\"}]"
  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'has no objects' do
      binding.pry
      expect(JSON['venues'].length).to eq(0)
    end
  end
end
