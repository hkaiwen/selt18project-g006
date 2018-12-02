# frozen_string_literal: true

class Leaderboard

  def self.get_users
    @final_names = []
    ids = User.order(score: :desc).pluck(:id)
    @ids = ids
    ids.each do |id|
      @names = User.where(:id => id).pluck(:first_name, :last_name, :score)
      full_name = @names[0][0].inspect.gsub('"','') + ' ' + @names[0][1].inspect.gsub('"','')
      @final_names << [full_name, @names[0][2]] unless full_name == 'admin admin'
    end
    return @final_names
  end
end
