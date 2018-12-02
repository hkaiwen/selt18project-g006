require 'spec_helper'
require 'rails_helper'

describe LeaderboardController do
  describe 'Get scores' do
    let(:leaderboard) { Leaderboard.get_users }
    let(:user) { User.order(score: :desc).pluck(:first_name, :last_name, :id) }
    before :each do
      @top_score = [['Robin', 'Hood', 20], ['Calvin', 'Klein', 10]]
    end
    it 'should call the model method to get the list of higher scores' do
      #@leaderboard = mock(Leaderboard)
      #expect(@leaderboard).to receive(:get_users).and_return(@top_score)
      #Leaderboard.any_instance.should_receive(:get_users).and_return(@top_score)
      #expect(Leaderboard.get_users).to receive(User.order(score: :desc).pluck).with(:first_name, :last_name, :id).and_return(@top_score)
      #expect(Leaderboard.get_users).to be_eql(@top_score)
      expect(leaderboard).to receive(user).and_return(@top_score)
      get :index
    end
    it 'should make the values available to the view'
  end
end
