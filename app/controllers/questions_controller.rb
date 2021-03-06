# frozen_string_literal: true

class QuestionsController < ApplicationController

  def index
    if params[:rdlevel] != nil
      session[:selected] = params[:rdlevel]
    end
    if session[:count].nil?
      session[:count] = 0
    end
    @ques_opt = []
    if params[:same]== 'yes' and params[:commit]== 'Submit'
      @ques_opt=params[:question]
      if !params[:explanation].nil?
        @exp ='Explanation: ' + params[:explanation]
        @answer = 'Answer: '+ params[:answer]
        @cal_score = params[:score]
      end
    else
      if !user_signed_in?
        session[:count] += 1
        if session[:count] > 10
          flash.now[:notice] = 'Please sign up'
           render "/welcome/landing"
        end
      end
      if session[:selected] == nil
         @questions = Question.pluck(:id,:questions,:answer,:option2,:option3,:option4,:level).sample
      else
         @questions = Question.where(:level => session[:selected]).pluck(:id,:questions,:answer,:option2,:option3,:option4,:level).sample
      end
      if session[:question].blank?
        (session[:question] ||= []) << @questions[1]
      elsif session[:question].include?(@questions[1])
        if session[:selected] == nil
           @new_question = Question.where.not(:questions => session[:question]).pluck(:id,:questions,:answer,:option2,:option3,:option4,:level)
        else
          @new_question = Question.where('questions NOT IN (?) AND level IN (?)', session[:question], session[:selected]).pluck(:id,:questions,:answer,:option2,:option3,:option4,:level)
        end
        if @new_question.empty?
          flash[:notice] = 'No more questions in database'
          render 'welcome/landing'
        else
          session[:question] << @new_question[0][1]
          @questions = @new_question[0]
        end
      else
        session[:question] << @questions[1]
      end
      if current_user
        @score = User.where(:id => current_user.id).pluck(:score)
        @cal_score = @score[0]
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
        @message = empty_param_hash.keys.join == 'level' ? 'Please select a level' : "#{empty_param_hash.keys.join} can't be blank"
      end
      redirect_to new_question_path
    else
      @question = Question.create_question!(@que[:question], @que[:answer], @que[:option2], @que[:option3], @que[:option4], @que[:explanation], @que[:level])
      if @question.save
        flash[:notice] = 'Question successfully added to question bank'
        redirect_to questions_path
      else
        @message = 'Question has already been taken'
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
        if current_user
          @cal_score = Question.calculate_scores(current_user.id, @question[6])
          User.find(current_user.id).update_column(:score, @cal_score)
        end
        flash[:correct] = 'Great! Your answer is correct'
      else
        if current_user
          @score = User.where(:id => current_user.id).pluck(:score)
          @cal_score = @score[0]
        end
        flash[:warning] = 'Sorry, This is the incorrect answer'
      end
       redirect_to questions_path request.params.merge({same: 'yes', explanation: @reply_array[:description], answer: @reply_array[:answer], score: @cal_score})
    end
  end

  def clear_session
    session[:count] = 0
    session[:question] = nil
    session[:selected] = nil
    redirect_to '/'
  end
end
