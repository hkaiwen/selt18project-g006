Given /the following users have been added to the User database:/ do |user_table|
  user_table.hashes.each do |user|
    User.create(user)
  end
end

When /I click on leaderboard/ do
  click_link("Leader board")
end

Then /I should see a display of top 10 players/ do
  visit leaderboard_path
  #expect(page).to have_content("Leaderboard")
  page.all('tr').count.should == 4
  expect(page).to have_content("Robin")
end
