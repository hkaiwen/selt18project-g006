require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'GET index' do
    before :each do
      #QuestionsController.class_variable_set(:@tot_ques,)
      #load 'questions_controller.rb'
      #@questions = [[5,'arduous means:', 'laborious', 'monstrous', 'ominous', 'perilous'],
       #             [2,'pragmatic means:', 'alterable','realistic','relaxing','domesticated'],
       #             [8,'gregarious means:', 'rustic', 'solemn','outgoing', 'frequent']]
      @questions = [[5,'arduous means:', 'laborious', 'monstrous', 'ominous', 'perilous'],
                    [2,'pragmatic means:', 'alterable','realistic','relaxing','domesticated']]
      @ques = [[5,'arduous means:', 'laborious', 'monstrous', 'ominous', 'perilous']]
      @new_question = [[3, 'transgression means:', 'violation', 'compression','persuasion','exemption']]
    end
    it 'should render index template ' do
      expect(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4).and_return(@ques)
      expect(get(:index)).to render_template('index')
      #@controller = WelcomeController.new
      #post :landing
    end

    it 'should not return the same question' do
      @@tot_ques = []
      @t_ques = []
      puts @@tot_ques
      puts 'inside same question'
      allow(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4).and_return(@@tot_ques = @ques)
      allow(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4).and_return(@questions)
      #puts @t_ques
      puts @@tot_ques
      @questions.each do |q|
        puts 'inside include'
        puts "tot #{@@tot_ques}"
        puts q
        if @@tot_ques[0] == q
          puts 'inside include'
          #qu = :questions => @@tot_ques[0][1]
          #expect(Question.where).to receive(:not).with(questions: @@tot_ques[0][1]).and_return(@new_question)
          expect(Question.where.not(questions: @@tot_ques[0][1])).to eq(@new_question)
          #expect(Question.where.not).to receive(:pluck).with(:questions => @@tot_ques[0][1]).and_return(@new_question)
        end
      end
      #if @t_ques.include?(@@tot_ques)
       # puts 'inside include'
      #allow(Question).to receive(:pluck).with(:id,:questions, :answer, :option2, :option3, :option4).and_return(@ques)
      #expect(Question.pluck(:id,:questions, :answer, :option2, :option3, :option4)).to receive(:sample).and_return(@ques)
        #expect(Question.where).to receive(:not).with(:questions => @@tot_ques).and_return(@new_question)
      #end
    end

  describe 'verifying answer' do
    context 'valid entry' do
      before :each do
        @checking_array = ['pragmatic means', 'alterable']
        @fake_results = {value: anything, answer: anything, description: anything}
      end
      it 'should get the values from view' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, {question: 'pragmatic means', optradio: 'alterable' }
      end
      it 'should call the appropriate model method to verify answer' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { question: 'pragmatic means', optradio: 'alterable'}
      end
      it 'should render index template' do
        @post = {action: :submit_answer, controller: :questions}
        #@controller = {:controller => 'questions'}
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { question: 'pragmatic means', optradio: 'alterable'}
        expect(response).to redirect_to(/^http:\/\/test.host\/questions\?action=submit_answer.*/)
      end
      it 'should flash message according to right or wrong answer' do
        fake_results = { value: 'correct', answer: anything, description: anything }
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(fake_results)
        post :submit_answer, { question: 'pragmatic means', optradio: 'alterable'}
        expect(flash[:notice]).to eq('Great!Your answer is correct')
      end
      it 'should make the verified results to index template' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { question: 'pragmatic means', optradio: 'alterable'}
        expect(assigns(:reply_array)).to eq(@fake_results)
      end
    end
    context 'invalid entry' do
      it 'should check for null values from view' do
        post :submit_answer, { opt_radio: ''}
        expect(flash[:notice]).to eq('Please select an answer')
        expect(response).to redirect_to(/^http:\/\/test.host\/questions\?action=submit_answer.*/)
      end
    end
  end
end
