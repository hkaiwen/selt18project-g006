# frozen_string_literal: true

class Question < ActiveRecord::Base
  validates :questions, :presence => true, uniqueness: {case_sensitive: false}
  validates :answer, :presence => true
  validates :option2, :presence => true
  validates :option3, :presence => true
  validates :option4, :presence => true
  validates :explanation, :presence => true

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

  def self.create_question!(question, answer, option2, option3, option4, explanation)
    @question = question
    @answer = answer
    @option2 = option2
    @option3 = option3
    @option4 = option4
    @explanation = explanation
    question = Question.where('questions LIKE ?', "%#{@question}%").pluck(:questions)
    puts "Question: #{question}"
    if question.present?
      return false
    else
      Question::create!(questions: @question, answer: answer, option2: option2, option3: option3, option4: option4, explanation: explanation)
      return true
    end
  end
end

