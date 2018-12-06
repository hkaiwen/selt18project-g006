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
end
