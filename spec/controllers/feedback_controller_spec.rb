require 'spec_helper'
require 'rails_helper'

describe FeedbackController do

  describe 'show feedback' do
    before :each do
      @feedback_result = [['feedback_text', 'test user', '2018-11-11', 5]]
      @feedback = Feedback.new(:feedback_text => 'feedback_text', :user_id => 1, :created_at => '2018-11-11', :rating => 5 )
      @feedback.save
      @user = User.new(id: 1, first_name: 'test',last_name: 'user',email: 'temp@gmail.com', password: '123456', score: 2)
      @user.save
    end
    it 'should render show template ' do
      expect(get(:show)).to render_template('show')
    end
    it 'should make the values available to the view' do
      allow(Feedback.joins(User)).to receive(:pluck).and_return(@feedback_result)
      get :show
      expect(assigns(:feedback_data)).to eq(@feedback_result)
    end
   end
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
      expect(flash[:notice]).to eq('Your feedback has been recorded!')
    end
  end
end
