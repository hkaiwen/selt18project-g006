# frozen_string_literal: true

class DeviseController::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:session_token]= user.session_token
      redirect_to questions_path
    else
      flash.now[:warning] = 'Invalid email/password'
      redirect_to login_path
    end
  end

  def destroy
    session[:session_token]=nil
    @current_user=nil
    flash[:notice]= 'Logged out of your account'
    redirect_to questions_path
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
