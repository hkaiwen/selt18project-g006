class QuestionsController < ApplicationController
  def index
    @ques_opt  = []
    @questions = Question.pluck(:questions,:answer,:option2,:option3,:option4).sample
    @options = @questions.slice(1..4).shuffle
    @ques_opt << @questions[0]
    @ques_opt << @options
    @ques_opt.flatten!
  end

  def new
    #empty method
  end

  def show
    @explain = Question.where(questions: params[:question]).pluck('explanation')
    @new_explain = @explain[0].scan(/\.(.*)/)
  end

  def submit_answer
    @checking_array = []
    @question = params[:question]
    @answer = params[:optradio]
    @checking_array << @question << @answer
    if @checking_array.any? {|a| a.nil?}
      flash[:notice] = 'Please select an answer'
    else
      @reply_array = Question.verify_answer(@checking_array)
        if @reply_array[:value] == 'correct'
          puts 'inside if'
          flash[:notice] = 'Great!Your answer is correct'
        else
          flash[:notice] = 'Sorry.This is the incorrect answer'
        end
    end
      redirect_to :back
  end
end
