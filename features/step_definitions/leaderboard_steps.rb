  Given /the following users have been added to the User database:/ do |user_table|
    user_table.hashes.each do |user|
      User.create(user)
    end
  end

  When /I click on leaderboard/ do
    click_link("Leader board")
  end

  Then /I should see a display of top 10 players/ do
    expect(page).to have_content("Leaderboard", "Frank")
    page.all('tr').count.should == 4
    expect(page).to have_content("Robin", "Edison")
  end

  When /I am on leaderboard page and click on back button/ do
    visit leaderboard_path
    click_on("Back")
  end

  When /I am logged in and on Leaderboard page/ do

  end
