require 'spec_helper'
require 'rails_helper'

describe FeedbackController do
  describe 'show feedback' do
    before :each do
      @feedbacks = [[]

                  ]
    end
    it 'should render show template ' do
      expect(Feedback).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4, :level).and_return(@questions)
      expect(get(:show)).to render_template('show')
    end
  end
end
