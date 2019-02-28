class SigninController < ApplicationController
    def create
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
