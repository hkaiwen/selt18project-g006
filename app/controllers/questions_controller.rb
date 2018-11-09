# frozen_string_literal: true

class QuestionsController < ApplicationController

  @@count = 0
  @@tot_ques = []

  def index
    @ques_opt = []
    if params[:same]== 'yes' and params[:commit]== 'Submit'
      @ques_opt=params[:question]
      if !params[:explanation].nil?
        @exp ='Explanation: ' + params[:explanation]
        @answer = 'Answer: '+ params[:answer]
      end
    else
      @questions = Question.pluck(:id,:questions,:answer,:option2,:option3,:option4).sample
      if @@tot_ques.empty?
        @@tot_ques << @questions[1]
      elsif @@tot_ques.include?(@questions[1])
        @new_question = Question.where.not(:questions => @@tot_ques).pluck(:id,:questions,:answer,:option2,:option3,:option4)
        @@tot_ques << @new_question[0][1]
        @questions = @new_question[0]
      else
        @@tot_ques << @questions[1]
      end
      @options = @questions.slice(2..5).shuffle
      @ques_opt << @questions[0] << @questions[1]
      @ques_opt << @options
      @ques_opt.flatten!
      if !user_signed_in?
        @@count += 1
        if @@count > 10
          flash[:notice] = 'Please sign up'
          render "/welcome/landing"
        end
      end

    end
  end

  def new
    #empty method
  end

  def create
    @que = params[:question]
    begin
      Question.create_question!(@que[:question], @que[:answer], @que[:option2], @que[:option3], @que[:option4], @que[:explanation])
      flash[:notice] = 'Question successfully added to question bank'
      redirect_to questions_path
    rescue
      flash[:warning] = 'All fields are required'
      redirect_to new_question_path
    end
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
