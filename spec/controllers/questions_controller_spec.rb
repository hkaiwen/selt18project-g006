require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'verifying answer' do
    it 'should get the values from view' do
      expect(Question).to receive(:verify_answer).with(:checking_array)
      post :submit_answer, {:question => 'pragmatic means', :answer => 'alterable' }
    end
    it 'should call the appropriate model method to verify answer'
    it 'should render index template' do
      post :submit_answer, { :question => ''}
      expect(response).to redirect_to('/questions')
    end





  end
end
