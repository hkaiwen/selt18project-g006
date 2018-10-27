require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'GET index' do
    it 'should alert for signup after count of 10 questions to display' do
      @count = 10
      @questions = ['efficacy means:', 'capacity or power to produce a desired result', 'the state of being restored to a former condition', 'good-natured tolerance of delay or incompetence', 'the act of concealing something from the public']
      @options = @questions.slice(1..4)
      get :index
      expect(response).to redirect_to('/welcome/landing')
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
