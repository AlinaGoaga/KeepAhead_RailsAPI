class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.all.to_json
  end
end
