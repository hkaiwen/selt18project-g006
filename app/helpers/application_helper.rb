module ApplicationHelper
  def admin?
    current_user.try(:admin?)
    # I made up the line above. Implement your own checks according to your setup
  end
end
