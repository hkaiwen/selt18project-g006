class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password)
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Sign-up Successful"
      redirect_to questions_path
    else
      flash[:notice] = 'Login Failed.'
      redirect_to new_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new

  end

end
