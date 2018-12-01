require 'spec_helper'
require 'rails_helper'

describe LeaderboardController do
  describe 'Get scores' do
    before :each do
      @top_score = [['Robin Hood', 20], ['Calvin Klein', 10]]
    end
    it 'should call the model method to get the list of higher scores' do
      #@leaderboard = mock(Leaderboard)
      #expect(@leaderboard).to receive(:get_users).and_return(@top_score)
      #Leaderboard.any_instance.should_receive(:get_users).and_return(@top_score)
      expect_any_instance_of(Leaderboard).to receive(:get_users)
      get :index
    end
    it 'should make the values available to the view'
  end
end
