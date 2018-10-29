class QuestionsController < ApplicationController

  @@count = 0
  @@tot_ques = []
  def index
   @ques_opt  = []
   @questions = Question.pluck(:id,:questions,:answer,:option2,:option3,:option4).sample
   puts "Questions: #{@questions}"
   if  @@tot_ques.empty?
     puts 'inside if'
     @@tot_ques << @questions[1]
   elsif @@tot_ques.include?(@questions[1])
     puts'inside else if'
     @new_question = Question.where.not(:questions => @@tot_ques).pluck(:id,:questions,:answer,:option2,:option3,:option4)
     puts @new_question[0][1]
     @@tot_ques << @new_question[0][1]
     @questions = @new_question[0]
   else
     puts 'inside else'
     @@tot_ques << @questions[1]
   end
   @options = @questions.slice(2..5).shuffle
   @ques_opt << @questions[0] << @questions[1]
   @ques_opt << @options
   @ques_opt.flatten!
   @@count += 1
   puts "count: #{@@count}"
   if @@count > 10
     flash[:notice] = 'Please sign up'
     render '/welcome/landing'
   end
  end

  def new
   #empty method
  end

  def show
   @explain = Question.where(id: params[:id]).pluck('explanation')
   @new_explain = @explain[0].scan(/\.(.*)/)
    redirect_to questions_path
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
