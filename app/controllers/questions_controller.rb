# frozen_string_literal: true

class QuestionsController < ApplicationController

  before_filter :set_current_user
  #@@count = 0
 # @@tot_ques = []


  def index
    if session[:count].nil?
      session[:count] = 0
    end
    @ques_opt = []
    if params[:same]== 'yes' and params[:commit]== 'Submit'
      @ques_opt=params[:question]
      if !params[:explanation].nil?
        @exp ='Explanation: ' + params[:explanation]
        @answer = 'Answer: '+ params[:answer]
      end
    else
      session[:count] += 1
      puts "Count: #{session[:count]}"
      if session[:count] > 10
        flash[:notice] = 'Please sign up'
        render "/welcome/landing"
      end
      @questions = Question.pluck(:id,:questions,:answer,:option2,:option3,:option4).sample
      #if @@tot_ques.empty?
      if session[:question].nil?
        #@@tot_ques << @questions[1]
        session[:question] << @questions[1]
      elsif @@tot_ques.include?(@questions[1])
        @new_question = Question.where.not(:questions => @@tot_ques).pluck(:id,:questions,:answer,:option2,:option3,:option4)
       # @@tot_ques << @new_question[0][1]
       session[:question] << @new_question[0][1]
        @questions = @new_question[0]
      else
        #@@tot_ques << @questions[1]
        session[:question] << @questions[1]
      end
      @options = @questions.slice(2..5).shuffle
      @ques_opt << @questions[0] << @questions[1]
      @ques_opt << @options
      @ques_opt.flatten!
      puts "Question: #{session[:question]}"
      #@@count += 1
      #if @@count > 10

    end
  end

  def new
    #empty method
  end

  def create
    puts 'inside create method'
    redirect_to questions_path

  end

  def submit_answer
    @checking_array = []
    @question = params[:question]
    @answer = params[:optradio]
    @checking_array << @question << @answer
    if @checking_array.any? {|a| a.nil?}
      flash[:notice] = 'Please select an answer'
      redirect_to questions_path request.params.merge({same: 'yes'})
    else
      @reply_array = Question.verify_answer(@checking_array)
      if @reply_array[:value] == 'correct'
        flash[:correct] = 'Great! Your answer is correct'
      else
        flash[:warning] = 'Sorry, This is the incorrect answer'
      end
      redirect_to questions_path request.params.merge({same: 'yes', explanation: @reply_array[:description], answer: @reply_array[:answer]})
    end
  end
end
