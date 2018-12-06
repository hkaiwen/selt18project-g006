require 'spec_helper'
require 'rails_helper'

describe FeedbackController do
  describe 'show feedback' do
    before :each do
      @feedback = ['feedback_text', 'test', 'user', '11-11-2018', 5]
    end
    it 'should render show template ' do
      expect(get(:show)).to render_template('show')
    end

    it 'should make the values available to the view' do
      allow(Feedback).to receive(:pluck).and_return(@feedback)
      get :show
      expect(assigns(:feedback_data)).to eq(@feedback)
    end
  end
end
