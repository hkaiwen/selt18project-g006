class FeedbackController < ApplicationController
  def index
  end

  def create
    @feedback = params[:feedback]['feedback']
    @rating = params[:rate]
    if  @rating.nil?
      flash[:notice] = 'You need to give us the rating'
      redirect_to feedback_path
    else
      current_user.feedbacks.create(feedback_text: @feedback, rating: @rating)
      flash[:notice] = 'Your feedback has been recorded!'
      redirect_to questions_path
    end
  end

  def show

  end
end
