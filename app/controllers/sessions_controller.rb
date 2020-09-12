class SessionsController < ApplicationController

    def new 
        @user = User.new 
    end 

    def create
        @user = User.new 
        if !params[:name].present?
            redirect_to "home"
        else 
            session[:name] = params[:name]
            redirect_to user_path(@user)
        end 
    end 

    def destroy
        if session[:name].present?
            session.delete :name
        end 
    end 
end 