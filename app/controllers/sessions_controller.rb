class SessionsController < Devise::SessionsController
  def create
    redirect_to qustions_path
  end

  def new

  end


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
  
end
