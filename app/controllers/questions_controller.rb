class QuestionsController < ApplicationController
 def index
   @ques_opt  = []
   if !params[:explanation].nil?
     @exp=params[:explanation]
     @ques_opt=params[:question]
   else
     @questions = Question.pluck(:questions,:answer,:option2,:option3,:option4).sample
     @options = @questions.slice(1..4).shuffle
     @ques_opt << @questions[0]
     @ques_opt << @options
     @ques_opt.flatten!
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
  def submit_answer
    @checking_array = []
    @question = params[:question]
    @answer = params[:optradio]
    @checking_array << @question[0] << @answer
    if @checking_array.any? {|a| a.nil?}
      flash[:notice] = 'Please select an answer'
    else
      @reply_array = Question.verify_answer(@checking_array)

        if @reply_array[:value] == 'correct'
          flash[:notice] = 'Great!Your answer is correct'
          redirect_to questions_path
        else
           flash[:notice] = 'Sorry.This is the incorrect answer'
           redirect_to questions_path request.params.merge({explanation: "this is explanation"})
        end

    end


  end
end
