require 'spec_helper'
require 'rails_helper'

describe Leaderboard do
  describe 'Get users' do
    before :each do
      @ids = [['Mary Wood', 5], ['Avanti Deshmukh', 2]]
      user = User.new(id: 1, first_name: 'Avanti',last_name: 'Deshmukh',email: 'avanti@gmail.com', password: '123456', score: 2)
      user.save
      user1 = User.new(id: 2, first_name: 'Mary', last_name: 'Wood', email: 'mary@gmail.com', password: 'mary123', score: 5)
      user1.save
    end
    it 'should get the descending order of scores' do
      Leaderboard.get_users
      allow(User.order(score: :desc)).to receive(:pluck).with(:id).and_return(@ids)
      expect(Leaderboard.get_users).to eq(@ids)

    end
  end
end
