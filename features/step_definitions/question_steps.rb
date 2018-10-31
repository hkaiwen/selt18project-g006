
Given /the following questions have been added to Question:/ do |question_table|
  question_table.hashes.each do |question|
    Question.create(question)
  end
end

Given /^I am on the question page$/ do
  visit questions_path
end

When /^I click on 'Get Start' button$/ do
  visit root_path
  click_button("Get Start")
end

Then /^I should be able to the play the game$/ do
  str = current_url
  expect(str.include?("question")).to be_truthy
end
