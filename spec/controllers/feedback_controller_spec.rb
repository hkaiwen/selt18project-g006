require 'spec_helper'
require 'rails_helper'

describe FeedbackController do
  describe 'Create feedback' do
    let(:feedback) { build :feedback, post: post }
    before :each do
      @feedback = 'This is test feedback'
      @rating = 5
    end
    it 'should give an error and stay at feedback page if there is no rating submitted' do
      post :create, {:feedback => {:feedback => @feedback}}
      expect(response).to redirect_to(feedback_path)
      expect(flash[:notice]).to eq('You need to give us the rating')
    end
    it 'should call Feedback create when user clicks submit feedback' do
      user = User.create!(id: 2, first_name: 'Avanti',last_name: 'Deshmukh',email: 'avanti@gmail.com', password: '123456', score: 2)
      allow_any_instance_of(FeedbackController).to receive(:current_user).and_return(user)
      expect {
        post :create, {:feedback => {:feedback => @feedback}, :rate => @rating, :user_id => 2}
      }.to change(Feedback, :count).by(1)
    end
  end
end
