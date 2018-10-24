class QuestionsController < ApplicationController
def index 
  @options   = Question.pluck(:answer,:option2,:option3,:option4).first.shuffle
  @questions = Question.pluck(:questions).first
end

def new
  #empty method
end
end
