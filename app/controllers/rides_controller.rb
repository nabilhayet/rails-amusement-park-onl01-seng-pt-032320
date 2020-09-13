class RidesController < ApplicationController
    
    
    def create
        @user = current_user
        @ride = Ride.new(ride_params)
        if @ride.valid?
            @ride.save
            @ride.take_ride 
            redirect_to user_path(@user)
        else
            render "new"
        end 
    end  

    private 
    
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end 
end
