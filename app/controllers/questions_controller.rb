class QuestionsController < ApplicationController
def index
  @ques_opt  = []
  @options   = Question.pluck(:answer,:option2,:option3,:option4).first.shuffle
  @questions = Question.pluck(:questions).first
  @ques_opt << @questions
  @ques_opt << @options
end

def new
  #empty method
end
end
