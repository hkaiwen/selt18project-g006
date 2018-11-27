require "rails_helper"
describe  Question do
  describe 'verify_answer method' do
    it 'should return correct string if answer is correct' do
      question = Question.new(:questions => "efficacy means:", :answer => 'capacity or power to produce a desired result', :option2 => 'the state of being restored to a former condition', :option3 => 'good-natured tolerance of delay or incompetence', :option4 => 'the act of concealing something from the public', :explanation => 'The degree to which a method or medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the efficacy of broccoli as a health benefit.')
      allow(Question).to receive(:find_by_questions).with("efficacy means:").and_return(question)
      result_check = Hash.new
      result_check[:value] ='correct'
      result_check[:description] = 'The degree to which a method or medicine brings about a specific result is its efficacy'
      result_check[:answer] = 'capacity or power to produce a desired result'
      Question.verify_answer(['efficacy means:','capacity or power to produce a desired result']) == result_check
    end
    it 'should return incorrect string if answer is correct' do
      question = Question.new(:questions => "efficacy means:", :answer => 'capacity or power to produce a desired result', :option2 => 'the state of being restored to a former condition', :option3 => 'good-natured tolerance of delay or incompetence', :option4 => 'the act of concealing something from the public', :explanation => 'The degree to which a method or medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the efficacy of broccoli as a health benefit.')
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
  end
end
