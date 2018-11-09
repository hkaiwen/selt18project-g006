
Given /the following questions have been added to Question:/ do |question_table|
  question_table.hashes.each do |question|
    Question.create(question)
  end
end

Given /^I am on the question page/ do
  visit questions_path
end

#And /^I am on the WordPower page$/ do
  #visit root_path
#end

When /^I click on 'Get Started' button$/ do
  visit root_path
  click_button("Get Started")
end

Then /^I should be able to the play the game$/ do
  str = current_url
  expect(str.include?("question")).to be_truthy
end


When /^I click on 'Next' button/ do
  @previous_question = page.find('#question').text
  click_on('Next')
end

Then /^I should get a new question$/ do
  current_question = page.find('#question').text
    if Question.find_by_questions(current_question) != nil
      expect current_question != @previous_question
    end
  end

Then /^I should see a question and 4 options$/ do
  current_question_text = page.find('#question').text
  current_question = Question.find_by_questions(current_question_text)
  page.all('ul li').each do |option|
  expect (option == current_question.answer) || (option == current_question.option2) || (option == current_question.option3) || (option == current_question.option4)
  end
  expect Question.find_by_questions(current_question) != nil
end

When /^I select the (.*?) answer$/ do |correct|
  @ques = page.find('#question').text
  @answer = Question.where(questions: @ques).pluck('answer')
  @option = Question.where(questions: @ques).pluck('option2')
  if correct == 'correct'
    choose :option => @answer[0]
  else
    choose :option => @option[0]
  end
  click_button('Submit')
end

Then /^I should see '(.*?)' on flash message$/ do |message|
  expect message == page.find('.alert').text
end


And(/^I am on the WordPower Page$/) do
  visit root_path
end
