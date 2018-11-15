# frozen_string_literal: true

class Question < ActiveRecord::Base
  validates :questions, :presence => true, uniqueness: true
  validates :answer, :presence => true
  validates :option2, :presence => true
  validates :option3, :presence => true
  validates :option4, :presence => true
  validates :explanation, :presence => true
  #validate :validate_question

=begin
  def validate_question(question)
    puts 'inside validating question'
    present_question = Question.where('questions LIKE :questions', {:questions => "%#{question}%"}).pluck(:questions)
    puts "Present question: #{present_question}"
    if present_question.present?
      errors.add(:questions, 'has already been taken')
    end
  end
=end
  def self.create_question!(question, answer, option2, option3, option4, explanation)
    @question = question
    @answer = answer
    @option2 = option2
    @option3 = option3
    @option4 = option4
    @explanation = explanation
    #Question @question_object = Question.new
    #ques = @question_object.validate_question(@question)
    #puts "Result of function: #{ques}"
    @present_question = Question.where('questions LIKE :questions', {:questions => "%#{question}%"})
    puts "present ques: #{@present_question.first.questions}"
    if @present_question.exists?
      raise ActiveRecord::RecordInvalid('has already been taken')
       #@present_question.error.add(:questions,'has already been taken')
      #@present_question.errors.add(:question, 'has already been taken')
    else
      Question.create!(questions: question, answer: answer, option2: option2, option3: option3, option4: option4, explanation: explanation)
    end
    end




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
end

