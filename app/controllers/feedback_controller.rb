class FeedbackController < ApplicationController
  def index
  end

  def create
    @feedback = params[:feedback]['feedback']
    current_user.feedbacks.create(feedback_text: @feedback)
    flash[:notice] = 'Your feedback has been recorded!'
    redirect_to questions_path
  end
end
