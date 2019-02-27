require 'net/http'
require 'json'


class SignupController < ApplicationController

  def create
    new_venue = params[:venue].permit(:name, :address, :email, :password, :lattitude, :longitude)


    lat_long = find_address(new_venue['address'])

      venue = Venue.new
      venue.name = new_venue['name']
      venue.email = new_venue['email']
      venue.password = new_venue['password']
      venue.address = new_venue['address']
      venue.lattitude = lat_long['lat']
      venue.longitude = lat_long['lng']
        if venue.save
          render json: venue
        end
  end


  private

    def find_address(address = '1600+Amphitheatre+Parkway,+Mountain+View')
      location = ask_google_api(address)
      return location
    end


    def ask_google_api(address)
        address = clean_address(address)
        url = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=AIzaSyBTwSpUW2WsDWTdODpCdxNMs1POdmpyI44")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
        request = Net::HTTP::Get.new(url.request_uri)
        res = http.request(request)
        res = JSON.parse(res.body)
        res['results'][0]['geometry']['location']
    end


    def clean_address(address)
        address = address.gsub(/\s+/, "+")
    end


end
