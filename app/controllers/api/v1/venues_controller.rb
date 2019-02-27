class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.includes(:donations).all.to_json(include: :donations)
  end

  def create
    user_location = params[:location].permit(:lat, :long)
    bounds = make_bounds(user_location)

    venues = Venue.where('lattitude BETWEEN ? AND ?',bounds[:lat_lower], bounds[:lat_upper]).where('longitude BETWEEN ? AND ?', bounds[:long_lower], bounds[:long_upper]).as_json 
    p '*****'
    venues = venues.each do |venue|
      venue[:distance] = haversineDistanceBetween(user_location, venue)
    end 
  
    #venues = venues.map{|venue| venue[:distance] = 1}
    ## go through add distance property to each object
    ## distance property val should be the result of haversine
    render json: venues
  end

  def show
    venue = Venue.find(params[:id])
    render json: venue
  end

  private

  def make_bounds(user_location)
    long_bound = 0.02
    lat_bound = 0.03
    user_lat = user_location['lat'].to_f.round(2)
    user_long = user_location['long'].to_f.round(2)


    return {
      lat_upper: (user_lat + lat_bound),
      lat_lower: (user_lat - lat_bound),
      long_upper: (user_long + long_bound),
      long_lower: (user_long - long_bound)
    }
  end

  def to_rad(x)
    x * (Math::PI / 180)
  end

  def haversineDistanceBetween(user, venue)
      lat1 = user[:lat].to_f.round(2)
      lon1 = user[:long].to_f.round(2)
      lat2 = venue['lattitude'].to_f.round(2)
      lon2 = venue['longitude'].to_f.round(2)
      p 'hey hey'
      p venue
      p lat2
      p lon2

      dLat = to_rad(lat2 - lat1);
      dLon = to_rad(lon2 - lon1);
      a = Math.sin(dLat/2) * Math.sin(dLat/2) +
          Math.cos(to_rad(lat1)) * Math.cos(to_rad(lat2)) *
          Math.sin(dLon/2) * Math.sin(dLon/2);
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    return d = 6371 * c; 
  end

 
end
