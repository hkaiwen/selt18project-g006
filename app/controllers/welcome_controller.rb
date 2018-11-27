class WelcomeController < ApplicationController
  def index

  end
  def landing
    if !current_user.nil? && current_user.first_name.to_s == 'admin'
      redirect_to rails_admin_path
    end
  end
end
