require "rails_helper"
describe  Question do
  describe 'verify_answer method' do
    it 'should return correct string if answer is correct' do
      question = Question.new(questions: "efficacy means:", answer: 'capacity or power to produce a desired result', option2: 'the state of being restored to a former condition', option3: 'good-natured tolerance of delay or incompetence', option4: 'the act of concealing something from the public', explanation: 'The degree to which a method or medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the efficacy of broccoli as a health benefit.',level: 'Easy')
      allow(Question).to receive(:find_by_questions).with("efficacy means:").and_return(question)
      result_check = Hash.new
      result_check[:value] ='correct'
      result_check[:description] = 'The degree to which a method or medicine brings about a specific result is its efficacy'
      result_check[:answer] = 'capacity or power to produce a desired result'
      Question.verify_answer(['efficacy means:','capacity or power to produce a desired result']) == result_check
    end
    it 'should return incorrect string if answer is correct' do
      question = Question.new(questions: "efficacy means:", answer: 'capacity or power to produce a desired result', option2: 'the state of being restored to a former condition', option3: 'good-natured tolerance of delay or incompetence', option4: 'the act of concealing something from the public', explanation: 'The degree to which a method or medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the efficacy of broccoli as a health benefit.',level: 'Easy')
      allow(Question).to receive(:find_by_questions).with("efficacy means:").and_return(question)
      result_check = Hash.new
      result_check[:value] ='incorrect'
      result_check[:description] = 'The degree to which a method or medicine brings about a specific result is its efficacy'
      result_check[:answer] = 'capacity or power to produce a desired result'
      Question.verify_answer(['efficacy means:','capacity or power to produce a desired']) == result_check
    end
  end
  describe 'create question method' do
    it 'should create new database object' do
      expect { Question.create_question!("question", "answer", "option2", "option3", "option4",  "explanation", "level") }.to change { Question.count }
    end

    it 'should add error if question already exists' do
      question = Question.new(:questions => "efficacy means:", :answer => 'capacity or power to produce a desired result', :option2 => 'the state of being restored to a former condition', :option3 => 'good-natured tolerance of delay or incompetence', :option4 => 'the act of concealing something from the public', :explanation => 'The degree to which a method or medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the efficacy of broccoli as a health benefit.', :level => 'easy')
      question.save
      expect{Question.create_question!("meaning of efficacy",  'capacity or power to produce a desired result', 'the state of being restored to a former condition',  'good-natured tolerance of delay or incompetence',  'the act of concealing something from the public',  'The degree to which a method or medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the efficacy of broccoli as a health benefit.', 'easy') }.to_not change {Question.count}
    end
  end
  describe 'calculate score method' do
    before :each do
      @score = [2]
      user = User.new(id: 1, first_name: 'Avanti',last_name: 'Deshmukh',email: 'avanti@gmail.com', password: '123456', score: 2)
      user.save
    end
    it 'should add the scores based on Easy level' do
      Question.calculate_scores(1,'Easy')
      allow(User.where(id: 1)).to receive(:pluck).with(:score).and_return(@score)
      expect(Question.calculate_scores(1,'Easy')).to eq(3)
    end
    it 'should add the scores based on medium level' do
      Question.calculate_scores(1,'Medium')
      allow(User.where(id: 1)).to receive(:pluck).with(:score).and_return(@score)
      expect(Question.calculate_scores(1,'Medium')).to eq(4)
    end
    it 'should add the scores based on Hard level' do
      Question.calculate_scores(1,'hard')
      allow(User.where(id: 1)).to receive(:pluck).with(:score).and_return(@score)
      expect(Question.calculate_scores(1,'Hard')).to eq(5)
    end
  end
end
