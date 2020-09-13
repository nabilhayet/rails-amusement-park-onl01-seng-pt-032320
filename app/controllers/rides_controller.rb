class RidesController < ApplicationController
    
    
    def create
       @ride = Ride.new 
       @user = current_user
       redirect_to user_path(@user)
    end 
end
