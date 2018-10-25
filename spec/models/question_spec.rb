describe  Question do


  describe 'verify_answer method' do


    it 'should check for correct answer' do
      part1 = Factory(question: "efficacy means:", answer: 'capacity or power to produce a desired result', option2: 'the state
   of being restored to a former condition', option3: 'good-natured tolerance of delay or incompetence',option4: 'the act of concealing something from the public', explanation: 'The degree to which a method or
   medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the
   efficacy of broccoli as a health benefit.')
      que1 = Hash.new
      que1[:value] ='correct'

      Question.verify_answer(['efficacy means:','capacity or power to produce a desired result']).should == que1
    end


  end
end
