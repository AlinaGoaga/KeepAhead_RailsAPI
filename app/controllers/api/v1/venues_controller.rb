class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.includes(:donations).all.to_json(include: :donations)
  end

  def show
    venue = Venue.find(params[:id])
    render json: venue
  end

  def create
    user_location = params[:location].permit(:lat, :long)
    render json: user_location
  end
end
