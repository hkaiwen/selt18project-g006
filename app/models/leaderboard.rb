# frozen_string_literal: true

class Leaderboard < ActiveRecord::Base

  def self.get_users
    ids = User.order('score desc').pluck(:id)
    puts "IDs: #{ids}"

  end
end
