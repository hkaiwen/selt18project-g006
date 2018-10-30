Given /the following questions have been added to Question:/ do |question_table|
  question_table.hashes.each do |question|
    Question.create(question)
  end
end

Given /^I am on the question page$/ do
  visit questions_path
end

When /^I click on 'Next' button/ do
  @current_question
  @previous_question = page.find('#question').text
  click_button('Next')
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
