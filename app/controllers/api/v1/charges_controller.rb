class Api::V1::ChargesController < ApplicationController
  def create
    # Amount in cents
    @amount = 500

    # customer = Stripe::Customer.create(
    #   email: params[:stripeEmail],
    #   source: params[:stripeToken]
    # )

    # Can create a charge directly, no need for a customer unless repeated billing is required
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'GBP'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    # Is the below correct?
    render json: error
  end
end
