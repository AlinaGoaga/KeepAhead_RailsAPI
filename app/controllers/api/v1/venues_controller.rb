class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.includes(:donations).all.to_json(include: :donations)
  end

  def create
    new_venue = params[:venue].permit(:name, :address, :email, :password)
    venue = Venue.create(new_venue)
    render json: venue
  end

  def show
    venue = Venue.find(params[:id])
    render json: venue
  end
end
