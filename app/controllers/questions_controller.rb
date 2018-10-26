class QuestionsController < ApplicationController

  @@count = 0
  def index
    @ques_opt  = []
    @questions = Question.pluck(:questions,:answer,:option2,:option3,:option4).sample
    @options = @questions.slice(1..4).shuffle
    @ques_opt << @questions[0]
    @ques_opt << @options
    @ques_opt.flatten!
    @@count += 1
    if @@count > 10
      puts "count: #{@@count}"
      flash[:notice] = 'Please sign up'
      render '/users/signup'
    end
  end

  def new
    #empty method
  end

  def show
    @explain = Question.where(questions: params[:question]).pluck('explanation')
    @new_explain = @explain[0].scan(/\.(.*)/)
  end


  # method to call verify_answer model method with an array as parameter.
  # Array consists of question and the answer selected by the user.
  # Model method would in turm return if the answer is correct or wrong along with the right answer for both the
  # cases and also 1/4th of the explanation to be displayed in an array  of hashes
  # PS: Am still working on the controller method(not yet fully implemented)
  #if @reply_array == 'correct'

  def submit_answer
    @checking_array = []
    @question = params[:question]
    @answer = params[:optradio]
    @checking_array << @question << @answer
    if @checking_array.any? {|a| a.nil?}
      flash[:notice] = 'Please select an answer'
    else
      @reply_array = Question.verify_answer(@checking_array)
      flash[:explain] = "Explanation: #{@reply_array[:description]}"

      if @reply_array[:value] == 'correct'
        flash[:notice] = 'Great!Your answer is correct'
      else
        flash[:notice] = 'Sorry. This is the incorrect answer'
        flash[:message] = "Correct answer is: #{@reply_array[:answer]}"
      end
    end
      redirect_to questions_path
  end
end
