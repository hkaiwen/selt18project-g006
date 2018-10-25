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

end
