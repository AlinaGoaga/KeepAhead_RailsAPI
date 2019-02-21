require 'net/http'
require_relative '../environmentVariables.rb'
require 'json'

class VenuesController < ApplicationController

    def index 
        @venues = Venue.all
    end 

    def create

        lat_long = find_address(params['name'])
    
        venue = Venue.new
        venue.name = params['name']
        venue.address = params['location']
        venue.lattitude = lat_long['lat']
        venue.longitude = lat_long['lng']
        if venue.save
          redirect_to '/venues'
        end
    end 

    def find_address(address = '1600+Amphitheatre+Parkway,+Mountain+View')
       location = ask_google_api(address)
       return location
       
    end 


    private 

    def ask_google_api(address)
        address = clean_address(address)
        url = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{GOOGLE_API_KEY}")

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
