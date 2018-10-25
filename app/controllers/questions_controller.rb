class QuestionsController < ApplicationController

  def index

  end

  # method to call verifyAnswer model method
  def submit_answer
    @checking_array = []
    @question = params[:question]
    @answer = params[:answer]
    @checking_array << @question << @answer
    Question.verify_answer(@checking_array)
    redirect_to questions_path
  end

end
