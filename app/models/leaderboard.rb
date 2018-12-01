# frozen_string_literal: true

class Leaderboard < ActiveRecord::Base

  def self.get_users
    @final_names = [[],[]]
    ids = User.order(score: :desc).pluck(:id)
    puts 'inside if'
    puts "IDs: #{ids}"
    @ids = ids
    ids.each do |id|
      @names = User.where(:id => id).pluck(:first_name, :last_name, :score)
      puts "Names: #{@names}"
      full_name = @names[0][0].inspect + ' ' + @names[0][1].inspect
      puts "full_name: #{full_name}"
      @final_names << [full_name, @names[0][2]]
    end
    return @final_names
  end
end
