class ApplicationController < ActionController::Base


#gives access to views
helper_method :current_user, :logged_in?

private    
  def current_user
    #if @current_user defined, use that, otherwise look for in table
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    !!session[:user_id]
  end
  
  # def redirect_if_not_logged_in
    
  #   redirect_to '/' unless logged_in?
  # end 



end
