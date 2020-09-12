class UsersController < ApplicationController

    def new 
        @user = User.new 
    end 

    def show 
        @user = User.find_by_id(params[:id])
    end 

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render "new"
        end 
        
    end 

    def signin
        @user = User.new 
    end 

    def login
        @user = User.find_by(name: params[:user][:name])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                render "signin"
            end 
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height)
    end 
end
