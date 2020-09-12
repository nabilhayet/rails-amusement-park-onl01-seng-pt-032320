class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home

  end 

  def is_logged_in?
    if session.key?("user_id")
        !!session[:user_id]
    end 
  end 

  def current_user
        @user = User.find_by_id(session[:user_id])
  end 

  

end
