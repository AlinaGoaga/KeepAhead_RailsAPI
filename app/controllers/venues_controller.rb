require 'net/http'
require_relative '../environmentVariables.rb'

class VenuesController < ApplicationController

    def index 
        p GOOGLE_API_KEY
     
    end 

    def create
        address =  params[location]
    end 

    def find_address(address)
        url = URI.parse("http://www.example.com/index.html")
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
        }
        puts res.body 
    end 

end
