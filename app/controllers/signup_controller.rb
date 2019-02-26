class SignupController < ApplicationController
  def create
    new_venue = params[:venue].permit(:name, :address, :email, :password)
    venue = Venue.create(new_venue)
    render json: venue
  end
end
