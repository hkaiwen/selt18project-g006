class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def set_current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
    redirect_to login_path unless @current_user
  end


  def after_sign_in_path_for(resource)
    "/questions"
  end

  def incrementCount
    session[:count] = 0
  end
end
