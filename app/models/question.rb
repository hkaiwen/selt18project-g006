# frozen_string_literal: true

class Question < ActiveRecord::Base
  validates :questions, :presence => true
  validates :answer, :presence => true
  validates :option2, :presence => true
  validates :option3, :presence => true
  validates :option4, :presence => true
  validates :explanation, :presence => true
  validates :level, :presence => true
  validate :duplicate_question, on: :create

=begin
  def self.create_question!(question, answer, option2, option3, option4, explanation, level)
    @question = question
    @answer = answer
    @option2 = option2
    @option3 = option3
    @option4 = option4
    @explanation = explanation
    @level = level
    Question::create!(questions: question, answer: answer, option2: option2, option3: option3, option4: option4, explanation: explanation, level: level)
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

  def self.create_question!(params)
    @questions = params[:question]
    @answer = params[:answer]
    @option2 = params[:option2]
    @option3 = params[:option3]
    @option4 = params[:option4]
    @explanation = params[:explanation]
    @level = params[:level]
    @question = Question::create(questions: @questions, answer: @answer, option2: @option2, option3: @option3, option4: @option4, explanation: @explanation, level: @level)
  end

=begin
  def duplicate_question
    @message = 'Question has already been taken'
    @answer_array = []
    puts 'inside validate model'
    question_array = self.questions.split(' ')
    if question_array.length == 1
      @question = Question.where('questions LIKE ?', "%#{self.questions}%")
      errors.add(:questions, @message) if @question.exists?
    else
      puts 'inside validate else'
      ids = Question.where('questions LIKE ?', "%#{question_array[0]}%").pluck(:id)
      puts "IDs: #{ids}"
      if ids.length > 1
        puts 'inside if id'
        ids.each do |id|
          question = Question.where('id = ?', id).pluck(:questions)
          errors.add(:questions, @message) if question.length >= question_array.length
        end
      else
        puts 'inside ids else'
        question = Question.where('id = ?', ids).pluck(:questions)
        puts "Questions : #{question}"
        errors.add(:questions, @message) if question.length <= question_array.length
      end
    end
  end
=end

  def duplicate_question
    puts 'inside validate model'
    @question = Question.where('questions LIKE ?', "%#{self.questions}%").pluck(:id,:questions)
    puts "Questions: #{@question}"
    errors.add(:questions, @message) if @question.any?
    #errors.add(:questions, @message) if @question
  end
end




