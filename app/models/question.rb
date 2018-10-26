class Question < ActiveRecord::Base
  def self.create_question!(question, answer, option2, option3, option4, explanation)
    @question = question
    @answer = answer
    @option2 = option2
    @option3 = option3
    @option4 = option4
    @explanation = explanation
    Question::create!(question: question, option2: option2, option3: option3, option4: option4, explanation: explanation)
  end

#  def self.visited_question(checking_array)
#      checking_array[2] = 1
 # end

  def self.verify_answer(checking_array)
    ques = Question.find_by(questions: checking_array[0])
    hash = Hash.new
    if ques.answer == checking_array[1]
      hash[:value] = 'correct'
    else
      hash[:value] = 'incorrect'
    end
  end



end

