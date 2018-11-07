class SessionsController < Devise::SessionsController
  def create
    redirect_to qustions_path
  end

end
