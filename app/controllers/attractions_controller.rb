class AttractionsController < ApplicationController
    def index 
        @attractions = Attraction.all
        @user = current_user
    end 

    def show 
        @attraction = Attraction.find_by(id: params[:id])
        @user = current_user
        @ride = @attraction.rides.build(user_id: @user.id)
    end 

    def new 
        @attraction = Attraction.new 
    end 

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.valid?
            @attraction.save
            @user = current_user
            redirect_to attraction_path(@attraction)
        else
            render "new"
        end 
        
    end  

    def edit    
        @attraction = Attraction.find_by_id(params[:id])
    end

    def update
        @attraction = Attraction.find_by_id(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private 
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end 
end
