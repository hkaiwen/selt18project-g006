# frozen_string_literal: true

class Question < ActiveRecord::Base
  validates :questions, :presence => true, uniqueness: true
  validates :answer, :presence => true
  validates :option2, :presence => true
  validates :option3, :presence => true
  validates :option4, :presence => true
  validates :explanation, :presence => true
  validates :level, :presence => true



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

  def self.calculate_scores(user_id)
    @score = User.where(:id => user_id).pluck(:score)
    cal_score = @score[0] + 1
  end
end

