require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'GET index' do
    before :each do
      @questions = [['arduous means:', 'laborious', 'monstrous', 'ominous', 'perilous'],
                    ['pragmatic means:', 'alterable','realistic','relaxing','domesticated'],
                    ['gregarious means:', 'rustic', 'solemn','outgoing', 'frequent']]
    end
    it 'should render index template ' do
      expect(Question).to receive(:pluck).with(:questions, :answer, :option2, :option3, :option4).and_return(@questions)
      expect(get(:index)).to render_template('index')
      #@controller = WelcomeController.new
      #post :landing
    end
    it 'should not repeat the questions' do
      #allow(Question).to receive(:pluck).with(:questions, :answer, :option2, :option3, :option4).and_return(@questions)
      #@@tot_ques = ['arduous means:','pragmatic means:']
      #Question.should_receive(:where).with(:questions => @@tot_ques).and_return(@questions)
      #Question.stub_chain(:where,:not).with(:questions => @@tot_ques).and_return(@questions)
      #expect(@questions).to eq(['gregarious means:', 'rustic', 'solemn','outgoing', 'frequent'])
      #Question.where.not(:questions => @@tot_ques).should_receive(:pluck).with(:questions, :answer, :option2, :option3, :option4).and_return(@questions)
      #expect(Question.where.not(:questions => @@tot_ques)).to eq(@questions)
      #Question.stub(:where,:not).with(:questions => @@tot_ques).and_return(['gregarious means:', 'rustic', 'solemn','outgoing', 'frequent'])
      #expect(Question).to receive(:where,:not).with(:questions => @@tot_ques).and_return(@questions)

    end
    it 'should alert for signup after count of 10 questions to display' do
       @@count = 11
       allow(Question).to receive(:pluck).with(:questions, :answer, :option2, :option3, :option4).and_return(@questions)
       expect(get(:index)).to render_template('welcome/landing')
    end
  end
  describe 'GET show' do
    it 'should give the detailed explanation' do
      question = 'efficacy means:'
      result = {:explanation => 'The degree to which a method or
   medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the
   efficacy of broccoli as a health benefit.'}
      expect(Question).to receive(:select).with(question).and_return(result)
      get :show, {:id => 'efficacy means:'}
    end
  end
  describe 'verifying answer' do
    context 'valid entry' do
      before :each do
        @checking_array = ['pragmatic means', 'alterable']
        @fake_results = {:value => anything, :answer => anything, :description => anything}
      end
      it 'should get the values from view' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, {:question => 'pragmatic means', :optradio => 'alterable' }
      end
      it 'should call the appropriate model method to verify answer' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
      end
      it 'should render index template' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
        expect(response).to redirect_to('/questions')
      end
      it 'should flash message according to right or wrong answer' do
        fake_results = { :value => 'correct', :answer => anything, :description => anything }
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
        expect(flash[:notice]).to eq('Great!Your answer is correct')
      end
      it 'should make the verified results to index template' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
        expect(assigns(:reply_array)).to eq(@fake_results)
      end
    end
    context 'invalid entry' do
      it 'should check for null values from view' do
        post :submit_answer, { :opt_radio => ''}
        expect(flash[:notice]).to eq('Please select an answer')
        expect(response).to redirect_to('/questions')
      end
    end
  end
end
