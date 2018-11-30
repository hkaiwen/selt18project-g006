require 'spec_helper'
require 'rails_helper'

describe Leaderboard do
  describe 'Get users' do
    it 'should get the descending order of scores' do
      ids = [1,2]
      user = User.new(id: 1, first_name: 'Avanti',last_name: 'Deshmukh',email: 'avanti@gmail.com', password: '123456', score: 2)
      user.save
      user1 = User.new(id: 2, first_name: 'Mary', last_name: 'Wood', email: 'mary@gmail.com', password: 'mary123', score: 5)
      user1.save
      expect(User.order('score desc')).to receive(:pluck).with(:id).and_return(ids)
      Leaderboard.get_users
    end
  end
end
