require 'spec_helper'
require 'rails_helper'

describe LeaderboardController do
  describe 'Get scores' do
    let(:leaderboard) { Leaderboard.get_users }
    let(:user) { User.order(score: :desc).pluck(:first_name, :last_name, :id) }
    before :each do
      @score = [['Robin', 'Hood', 20], ['Calvin', 'Klein', 10]]
    end
    it 'should call the model method to get the list of higher scores' do
      expect(Leaderboard).to receive(:get_users).and_return(@score)
      get :index
    end
    it 'should make the values available to the view' do
      expect(Leaderboard).to receive(:get_users).and_return(@score)
      get :index
      expect(assigns(:top_score)).to eq(@score)
    end
  end
end
