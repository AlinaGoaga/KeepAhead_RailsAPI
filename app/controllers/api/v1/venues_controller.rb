# frozen_string_literal: true

class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.includes(:donations).all.to_json(include: :donations)
  end

  def create
    requestType = params[:type]
    signup_or_signin(requestType)
  end

  def show
    @venue = Venue.find(params[:id])
  end

  private 

  def signup_or_signin(requestType) 
    if requestType == 'signup'
      signup()
    elsif requestType == 'signin'
       signin()
    else
    end
  end

  def signup
    new_venue = params[:venue].permit(:name, :address, :email, :password)
    venue = Venue.create(new_venue)
    render json: venue
  end

  def signin
    credentials = params[:venue].permit(:email, :password)
   
    venue = Venue.where("email = ? AND password = ?", credentials[:email], credentials[:password]).exists?(conditions = :none)

   
    if venue == true
      venue = Venue.where("email = ? AND password = ?", credentials[:email], credentials[:password])
      render json: venue
     
    else 

      render json: { status: '400' }
    end
  end
end
