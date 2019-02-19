require 'net/http'
require_relative '../environmentVariables.rb'

class VenuesController < ApplicationController

    def index 
        p GOOGLE_API_KEY
     
    end 

    def create
        address =  params[location]
        find_address()
    end 

    def find_address(address = '1600+Amphitheatre+Parkway,+Mountain+View')

        url = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=address=1600+Amphitheatre+Parkway,
        +Mountain+View&key=AIzaSyBTwSpUW2WsDWTdODpCdxNMs1POdmpyI44")


        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
        request = Net::HTTP::Get.new(url.request_uri)
        res = http.request(request)
        p res.body.results.formatted_address
    end 

end
