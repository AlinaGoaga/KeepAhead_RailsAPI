# frozen_string_literal: true

class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.includes(:donations).all.to_json(include: :donations)
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
