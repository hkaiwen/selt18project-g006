# frozen_string_literal: true

class Leaderboard

  def self.get_users
    @final_names = []
    @names = User.order(score: :desc).limit(10).pluck(:first_name,:last_name,:score)
    @names.each do |name|
      if name[2] != 0
        full_name = name[0].inspect.gsub('"','') + ' ' + name[1].inspect.gsub('"','')
        @final_names << [full_name, name[2]] unless full_name == 'admin admin'
      end
    end
    return @final_names
  end
end




