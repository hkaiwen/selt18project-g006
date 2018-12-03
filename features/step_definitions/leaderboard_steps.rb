Given /the following users have been added to the User database:/ do |user_table|
  user_table.hashes.each do |user|
    User.create(user)
  end

  When /I click on leaderboard/ do

  end
end
