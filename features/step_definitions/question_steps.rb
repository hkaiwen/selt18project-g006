
Given /the following questions have been added to Question:/ do |question_table|
  question_table.hashes.each do |question|
    Question.create(question)
  end
end

Given /^I am on the question page/ do
  visit questions_path
end

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
  #@@tot_ques << @previous_question
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
  #@@count = 1
  #@@tot_ques = []
  @ques = page.find('#question').text
  #@@tot_ques << @ques
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
  puts page.find('.alert').text
  expect(message == page.find('.alert').text).to be_truthy
end


And(/^I am on the WordPower Page$/) do
  visit root_path
end

When /^I click on 'Add question to the question bank' button$/ do
  click_on('Add question to the question bank')
end

When /^I fill a new question (.*?) all field and submit$/ do |with|
  @ques||={question: 'soluble means:', o1: 'single person', o2: 'happy to receive',
           o3: 'solar system', answer: 'dissolvable', explanation: 'be able to solve in water'}
  fill_in 'question_question', with: @ques[:question]
  fill_in 'question_option2', with: @ques[:o1]
  fill_in 'question_option3', with: @ques[:o2]
  fill_in 'question_option4', with: @ques[:o3]
  fill_in 'question_answer', with: @ques[:answer]
  if with == 'with'
    fill_in 'question_explanation', with: @ques[:explanation]
  end
  click_button 'Add this question'


end
