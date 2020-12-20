class ApplicationController < ActionController::Base

  def current_user
    #if @current_user defined, use that, otherwise look for in table
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    !!current_user
  end
  
  def redirect_if_not_logged_in
    redirect to '/' if !logged_in?
  end 



end
