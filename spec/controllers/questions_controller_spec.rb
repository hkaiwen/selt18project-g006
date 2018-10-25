require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'verifying answer' do
    it 'should get the values from view' do
      @checking_array = ['pragmatic means', 'alterable']
      expect(Question).to receive(:verify_answer).with(@checking_array)
      post :submit_answer, {:question => 'pragmatic means', :optradio => 'alterable' }
    end
    it 'should call the appropriate model method to verify answer'
    it 'should render index template' do
      post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
      expect(response).to redirect_to('/questions')
    end
    it 'should check for null values from view' do
      post :submit_answer, { :question => '', :opt_radio => ''}
      expect(flash[:notice]).to be_present
      expect(response).to redirect_to('/questions')
    end





  end
end
