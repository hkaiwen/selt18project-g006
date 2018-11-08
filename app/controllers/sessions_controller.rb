class SessionsController < Devise::SessionsController
  def create
    redirect_to qustions_path
  end

  def new

  end


  def destroy
    #destroy sessions
  end
end

