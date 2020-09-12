class SessionsController < ApplicationController

    def new 
        @user = User.new 
    end 

    def create
        # binding.pry 
        if !params[:user][:name].present?
            render "/"
        else
            @user = User.find(params[:user][:name])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
                
            else 
                render "new"
            end 
        end 
    end 

    def destroy
        if session[:name].present?
            session.delete :name
        end 
    end 
end 