class QuestionsController < ApplicationController

  def index

  end

  # method to call verify_answer model method with an array as parameter.
  # Array consists of question and the answer selected by the user.
  # Model method would in turm return if the answer is correct or wrong along with the right answer for both the
  # cases and also 1/4th of the explanation to be displayed in an array  of hashes
  # PS: Am still working on the controller method(not yet fully implemented)
  #
  #added a visited variable to checking_array
  # need to add a condition to check @visited = 0/1 before displaying question
  def submit_answer
    @visited = 0
    @checking_array = []
    @question = params[:question]
    @answer = params[:optradio]
    @checking_array << @question << @answer << @visited
    if @checking_array.all? {|a| a.nil?}
      flash[:notice] = 'Please select an answer'
    else
      @checking_array[2] = 1
      @reply_array = Question.verify_answer(@checking_array)
      @reply_array.each do |hash|
        if hash[:value] == 'correct'
          flash[:notice] = 'Great!Your answer is correct'
        else
           flash[:notice] = 'Sorry.This is the incorrect answer'
        end
      end
    end
    redirect_to questions_path

  end
end
