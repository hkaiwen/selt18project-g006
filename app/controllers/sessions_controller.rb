class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
#sign in and redirect to show page
      session[:session_token]= user.session_token
      redirect_to questions_path
    else
      flash.now[:warning] = 'Invalid email/password'
      redirect_to login_path
    end

    def destroy
    #destroy session

    end

  end
end
