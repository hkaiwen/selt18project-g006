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
    puts "User: #{User.count}"
    #puts "Feedback: #{Feedback.user_id}"
    @feedback_data = Feedback.joins(:user).pluck(:feedback_text, :first_name, :last_name, :created_at, :rating)
                       .map{|e| [e[0], e[1] + " " + e[2], e[3].strftime("%F"), e[4]]}
    puts "Feedback value: #{@feedback_data}"
    render :partial => 'show' and return if request.xhr?
    #respond_to do |format|
     # puts @feedback_data
      #format.js
    #end
  end
end
