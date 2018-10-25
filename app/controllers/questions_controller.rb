class QuestionsController < ApplicationController

  def index

  end

  # method to call verify_answer model method with an array as parameter.
  # Array consists of question and the answer selected by the user.
  # Model method would in turm return if the answer is correct or wrong along with the right answer for both the
  # cases and also 1/4th of the explanation to be displayed in an array or array of hashes
  # PS: Am still working on the controller method(not yet fully implemented)
  def submit_answer
    @checking_array = []
    @question = params[:question]
    @answer = params[:optradio]
    @checking_array << @question << @answer
    puts "checking array: #{@checking_array}"
    if @answer.blank? && @checking_array.all? {|a| a.nil?}
      puts 'inside if'
      flash[:notice] = 'Please select an answer'
    else
      Question.verify_answer(@checking_array)
    end
    redirect_to questions_path
  end

end
