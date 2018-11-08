class SessionsController < Devise::SessionsController
  def create
    redirect_to questions_path
  end

  def new

  end


  def destroy
    #destroy sessions

  end
end
