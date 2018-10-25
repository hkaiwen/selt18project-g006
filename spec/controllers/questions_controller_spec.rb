require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'verifying answer' do
    it 'should get the values from view'
    it 'should call the appropriate model method to verify answer'
    it 'should render index template' do
      post :submit_answer, { :question => ''}
      expect(response).to redirect_to('/questions')
    end





  end
end
