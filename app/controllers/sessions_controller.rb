class SessionsController < ApplicationController

  def new

  end

  def create
    if
      redirect_to questions_path
    else
      flash[:notice] = 'Login Failed.'
      redirect_to login_path
    end
  end

  def destroy
    #destroy session

  end
end
