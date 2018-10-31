
When /^I click on 'Get Start' button$/ do
  visit root_path
  click_button("Get Start")
end

Then /^I should be able to the play the game$/ do
  url = URI.parse(current_url)
  url.include?("questions")
end
