class Api::V1::DonationsController < ApplicationController

  def index
    venue = Venue.find(params[:venue_id])
    venue_donations = venue.donations
    render json: venue_donations
  end
  
  def create
    venue = Venue.find(params[:venue_id])
    venue_donations = venue.donations
    new_donation = params[:donation].permit(:amount, :passphrase)
    donation = venue_donations.create!(new_donation.merge(venue: venue))
    render json: donation
  end
  
end
