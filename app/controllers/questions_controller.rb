# frozen_string_literal: true

class QuestionsController < ApplicationController

  def index
    if session[:count].nil?
      session[:count] = 0
    end
    @ques_opt = []
    @lev =[]
    if params[:same]== 'yes' and params[:commit]== 'Submit'
      @ques_opt=params[:question]
      if !params[:explanation].nil?
        @exp ='Explanation: ' + params[:explanation]
        @answer = 'Answer: '+ params[:answer]
      end
    else
      if !user_signed_in?
        session[:count] += 1
        if session[:count] > 10
          flash.now[:notice] = 'Please sign up'
          render "/welcome/landing"
        end
      end
      @questions = Question.pluck(:id,:questions,:answer,:option2,:option3,:option4,:level).sample
      if session[:question].blank?
        (session[:question] ||= []) << @questions[1]
      elsif session[:question].include?(@questions[1])
        @new_question = Question.where.not(:questions => session[:question]).pluck(:id,:questions,:answer,:option2,:option3,:option4,:level)
        if @new_question.empty?
          flash[:notice] = 'No more questions in database'
          #redirect_to '/'
          render 'welcome/landing'
        else
          session[:question] << @new_question[0][1]
          @questions = @new_question[0]
        end
      else
        session[:question] << @questions[1]
      end
      @options = @questions.slice(2..5).shuffle
      @ques_opt << @questions[0] << @questions[1]
      @ques_opt << @options
      @ques_opt << @questions[6]
      @ques_opt.flatten!
    end
  end

  def new
    # render new question page
  end

  def create
    empty_param_hash = {}
    @message = ""
    @que = params[:question]
    if @que.values.any?(&:blank?)
      @que.each do |key, value|
        if @que[key].blank?
          empty_param_hash[key] = value
        end
      end
      if empty_param_hash.length > 1
        @message = 'Sorry, All fields are required'
      else
        @message = "#{empty_param_hash.keys.join} can't be blank"
      end
      redirect_to new_question_path
    else
      begin
        Question.create_question!(@que[:question], @que[:answer], @que[:option2], @que[:option3], @que[:option4], @que[:explanation], @que[:level])
        flash[:notice] = 'Question successfully added to question bank'
        redirect_to questions_path
      rescue ActiveRecord::RecordInvalid => e
        if e.record.errors[:questions] == ['has already been taken']
          @message = 'Question has already been taken'
        end
        redirect_to new_question_path
      end
    end
    flash[:warning] = @message
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

  def clear_session
    session[:count] = 0
    session[:question] = nil
    redirect_to '/'
  end
end
