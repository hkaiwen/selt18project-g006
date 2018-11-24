# frozen_string_literal: true

class Question < ActiveRecord::Base
  validates :questions, :presence => true
  validates :answer, :presence => true
  validates :option2, :presence => true
  validates :option3, :presence => true
  validates :option4, :presence => true
  validates :explanation, :presence => true
  validate :duplicate_question, on: :create
=begin
  def self.create_question!(question, answer, option2, option3, option4, explanation)
    @question = question
    @answer = answer
    @option2 = option2
    @option3 = option3
    @option4 = option4
    @explanation = explanation
    Question::create!(questions: question, answer: answer, option2: option2, option3: option3, option4: option4, explanation: explanation)
  end
=end


  def self.verify_answer(checking_array)
    ques = Question.find_by_questions(checking_array[0])
    hash = Hash.new
    hash[:description] = ques.explanation
    hash[:answer] = ques.answer
    if ques.answer == checking_array[1]
      hash[:value] = 'correct'
    else
      hash[:value] = 'incorrect'
    end
    return hash
  end

  def self.create_question(params)
    puts 'inside create question model'
    @questions = params[:question]
    @answer = params[:answer]
    @option2 = params[:option2]
    @option3 = params[:option3]
    @option4 = params[:option4]
    @explanation = params[:explanation]
    @question = Question::create(questions: @questions, answer: @answer, option2: @option2, option3: @option3, option4: @option4, explanation: @explanation)

  end

  def duplicate_question
    puts 'inside validate model'
    question = Question.where('questions LIKE ?', "%#{self.questions}%")
    if question.exists?
      errors.add(:questions, 'Question has already been taken')
    end
  end
end



