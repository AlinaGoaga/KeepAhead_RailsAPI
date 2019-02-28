class Api::V1::DonationsController < ApplicationController
  def index
    venue = Venue.find(params[:venue_id])
    venue_donations = venue.donations
    render json: venue_donations
  end

  def create
    create_stripe_payment(donation_params)
    venue = Venue.find(params[:venue_id])
    venue_donations = venue.donations
    donation = venue_donations.create!(donation_params.merge(venue: venue))
    render json: donation
  end

  def update
    donation = Donation.find(params[:id])
    donation.update(redeemed: params[:redeemed])
    render json: donation
  end

  private

  def donation_params
    params[:donation].permit(:amount, :passphrase, :email, :token, :currency, :description)
  end

  def create_stripe_payment(params)
    customer = Stripe::Customer.create(
      source: params[:token],
      email: params[:email]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params[:amount],
      currency: params[:currency]
    )
  end
end
