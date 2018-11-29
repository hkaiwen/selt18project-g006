
def create_question
  @question ||= {questions: 'soluble means:', option2: 'single person', option3: 'happy to receive',
           option4: 'solar system', answer: 'dissolvable', explanation: 'be able to solve in water', level: 'easy'}
end

def add_question
  fill_in 'question_question', with: @question[:questions]
  fill_in 'question_option2', with: @question[:option2]
  fill_in 'question_option3', with: @question[:option3]
  fill_in 'question_option4', with: @question[:option4]
  fill_in 'question_answer', with: @question[:answer]
  fill_in 'question_explanation', with: @question[:explanation]
  find('#question_level').find(:option, "#{@question[:level]}").select_option
  click_button 'Add this question'
end

Given /the following questions have been added to Question Database:/ do |question_table|
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
  puts page.find('.alert').text
  expect(message == page.find('.alert').text).to be_truthy
end


And(/^I am on the WordPower Page$/) do
  visit root_path
end

When /^I click on 'Add question to the question bank' button$/ do
  click_on('Add question to the question bank')
end

When /^I fill in all the fields and submit$/ do
  create_question
  add_question
end


Then(/^I should not see add question button$/) do
  expect(page).not_to have_button('Add question to the question bank')
end


Then(/^I fill in all the fields except (.*?) and submit$/) do |field|
  create_question
  case field
  when 'question'
    @question = @question.merge(questions: '')
    add_question
  when 'option2'
    @question = @question.merge(option2: '')
    add_question
  when 'option3'
    @question = @question.merge(option3: '')
    add_question
  when 'option4'
    @question = @question.merge(option4: '')
    add_question
  when 'answer'
    @question = @question.merge(answer: '')
    add_question
  when 'explanation'
    @question = @question.merge(explanation: '')
    add_question
  when 'level'
    fill_in 'question_question', with: @question[:questions]
    fill_in 'question_option2', with: @question[:option2]
    fill_in 'question_option3', with: @question[:option3]
    fill_in 'question_option4', with: @question[:option4]
    fill_in 'question_answer', with: @question[:answer]
    fill_in 'question_explanation', with: @question[:explanation]
    click_button 'Add this question'
  else
    'No more fields to fill in'
  end
end

Then(/^I enter duplicate question without entering other fields$/) do
  create_question
  Question.create(@question)
  @question = @question.merge(option2: '')
  @question = @question.merge(option3: '')
  @question = @question.merge(option4: '')
  @question = @question.merge(answer: '')
  @question = @question.merge(explanation: '')
  add_question
end


Then(/^I enter duplicate question along with other fields$/) do
  create_question
  Question.create(@question)
  @question = @question.merge(answer: 'dissolvable')
  @question = @question.merge(option2: 'Water')
  @question = @question.merge(option3: 'Liquid')
  @question = @question.merge(option4: 'Solid')
  @question = @question.merge(explanation: 'able to be dissolved, especially in water')
  @question = @question.merge(level: 'medium')
  add_question
end


When(/^I do not select any option and click submit$/) do
  click_button 'Submit'
end
