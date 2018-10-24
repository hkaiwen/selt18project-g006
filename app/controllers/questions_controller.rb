class QuestionsController < ApplicationController

  def index

  end

  def getStarted
    @question_array = []
    @question = Question.select(:questions).first
    @answers = Question.pluck(:answer, :option2, :option3, :option4).first
    @question_array << @question
    @question_array << @answers.shuffle
    redirect_to '/questions'
  end

end
