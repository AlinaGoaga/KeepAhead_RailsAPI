require 'net/http'
require_relative '../environmentVariables.rb'
require 'json'

class VenuesController < ApplicationController

    def index 
        
    end 

    def create
     

        address = params[location]
        p '********'
        p address
        clean_address(address)
        find_address(address)
    end 

    def find_address(address = '1600+Amphitheatre+Parkway,+Mountain+View')
       location = ask_google_api(address)
       
    end 

    private 

    def ask_google_api(address)

        url = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=address=1600+Amphitheatre+Parkway,
        +Mountain+View&key=#{GOOGLE_API_KEY}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
        request = Net::HTTP::Get.new(url.request_uri)
        res = http.request(request)
        res = JSON.parse(res.body)
        res['results'][0]['geometry']['location']
    end
    

    def clean_address(address)
        p address
        address = address.gsub(/\s+/, "+")
    end
end
