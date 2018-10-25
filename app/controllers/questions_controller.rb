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
end
