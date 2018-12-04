# frozen_string_literal: true

def create_question
  @question ||= {questions: 'soluble means:', option2: 'single person', option3: 'happy to receive',
                 option4: 'solar system', answer: 'dissolvable', explanation: 'be able to solve in water', level: 'Easy'}
end

def add_question
  fill_in 'question_question', with: @question[:questions]
  fill_in 'question_option2', with: @question[:option2]
  fill_in 'question_option3', with: @question[:option3]
  fill_in 'question_option4', with: @question[:option4]
  fill_in 'question_answer', with: @question[:answer]
  fill_in 'question_explanation', with: @question[:explanation]
  find('#question_level').find(:option, (@question[:level]).to_s).select_option
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
  click_button('Get Started')
end

Then /^I should be able to the play the game$/ do
  str = current_url
  expect(str.include?('question')).to be_truthy
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
  expect !Question.find_by_questions(current_question).nil?
end

When /^I select the (.*?) answer$/ do |correct|
  @ques = page.find('#question').text
  @answer = Question.where(questions: @ques).pluck('answer')
  @option = Question.where(questions: @ques).pluck('option2')
  if correct == 'correct'
    choose option: @answer[0]
  else
    choose option: @option[0]
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
  @question = @question.merge(level: 'Medium')
  add_question
end


When(/^I do not select any option and click submit$/) do
  click_button 'Submit'
end

Then(/^I should not see Select button on questions page$/) do
  expect(page).not_to have_selector('#select')

end


Then(/^I should not see Scores on questions page$/) do
  expect(page).not_to have_selector('#score')
end


Then(/^I should not see levels on questions page$/) do
  expect(page).not_to have_selector('#option1')
  expect(page).not_to have_selector('#option2')
  expect(page).not_to have_selector('#option3')
end

Then(/^I select (.*?) level$/) do |level|
case level
when 'Easy'
  page.choose(option: 'Easy')
when 'Medium'
  page.choose(option: 'Medium')
when 'Hard'
  page.choose(option: 'Hard')
else
  #empty
end
 find_by_id('select_level').click
end


Then(/^I should get a question based on (.*?) level$/) do |level|
 case level
 when 'Easy'
   expect(page).to have_content('Difficulty: Easy')
 when 'Medium'
   expect(page).to have_content('Difficulty: Medium')
 when 'Hard'
   expect(page).to have_content('Difficulty: Hard')
 else
   #empty
 end
end


Then(/^I should see (.*?) based on level$/) do |score|
  expect(page).to have_content(score)
end

Then(/^I can add a question$/) do
  create_question
  find('tr', text: 'Questions').click_link 'Questions'
  click_link 'Add new'
  fill_in 'Questions', with: @question[:questions]
  fill_in 'Answer', with: @question[:answer]
  fill_in 'Option2', with: @question[:option2]
  fill_in 'Option3', with: @question[:option3]
  fill_in 'Option4', with: @question[:option4]
  fill_in 'Explanation', with: @question[:explanation]
  fill_in 'Level', with: @question[:level]
  click_button 'Save'
  expect Question.where(questions: 'soluble means').exists? == true
end

Then(/^I cannot add a question that already in the database$/) do
  create_question
  Question.create(@question)
  expect Question.where(questions: 'soluble means').count == 1
  find('tr', text: 'Questions').click_link 'Questions'
  click_link 'Add new'
  fill_in 'Questions', with: @question[:questions]
  fill_in 'Answer', with: @question[:answer]
  fill_in 'Option2', with: @question[:option2]
  fill_in 'Option3', with: @question[:option3]
  fill_in 'Option4', with: @question[:option4]
  fill_in 'Explanation', with: @question[:explanation]
  fill_in 'Level', with: @question[:level]
  click_button 'Save'
  expect Question.where(questions: 'soluble means').count == 1
end

Then(/^I cannot add question if any of the field is missing$/) do
  create_question
  find('tr', text: 'Questions').click_link 'Questions'
  click_link 'Add new'
  click_button 'Save'
  page.should have_content("Questions can't be blank")
  fill_in 'Questions', with: @question[:questions]
  click_button 'Save'
  page.should have_content("Answer can't be blank")
  fill_in 'Answer', with: @question[:answer]
  click_button 'Save'
  page.should have_content("Option2 can't be blank")
  fill_in 'Option2', with: @question[:option2]
  click_button 'Save'
  page.should have_content("Option3 can't be blank")
  fill_in 'Option3', with: @question[:option3]
  click_button 'Save'
  page.should have_content("Option4 can't be blank")
  fill_in 'Option4', with: @question[:option4]
  click_button 'Save'
  page.should have_content("Explanation can't be blank")
  fill_in 'Explanation', with: @question[:explanation]
  click_button 'Save'
  page.should have_content("Level can't be blank")
end

Then(/^I can add another question if choose save and add another$/) do
  create_question
  find('tr', text: 'Questions').click_link 'Questions'
  click_link 'Add new'
  fill_in 'Questions', with: @question[:questions]
  fill_in 'Answer', with: @question[:answer]
  fill_in 'Option2', with: @question[:option2]
  fill_in 'Option3', with: @question[:option3]
  fill_in 'Option4', with: @question[:option4]
  fill_in 'Explanation', with: @question[:explanation]
  fill_in 'Level', with: @question[:level]
  click_button 'Save and add another'
  expect Question.where(questions: 'soluble means').exists? == true
  page.should have_content('Question successfully created')
  page.should have_content("Save and add another")
end

Then(/^I can add another question and edit it if they click on save and edit$/) do
  create_question
  find('tr', text: 'Questions').click_link 'Questions'
  click_link 'Add new'
  fill_in 'Questions', with: @question[:questions]
  fill_in 'Answer', with: @question[:answer]
  fill_in 'Option2', with: @question[:option2]
  fill_in 'Option3', with: @question[:option3]
  fill_in 'Option4', with: @question[:option4]
  fill_in 'Explanation', with: @question[:explanation]
  fill_in 'Level', with: @question[:level]
  click_button 'Save and edit'
  expect Question.where(questions: 'soluble means').exists? == true
  page.should have_content('Question successfully created')
  page.should have_content("Edit Question")
  expect (find_field('Questions').value == @question[:questions])
  expect (find_field('Answer').value == @question[:answer])
  expect (find_field('Option2').value == @question[:option2])
  expect (find_field('Option3').value == @question[:option3])
  expect (find_field('Option4').value == @question[:option4])
end

And(/^I fill in filter for (.*?)$/) do |field|
  if field == "question"
    find('tr', text: 'Questions').click_link 'Questions'
    fill_in 'Filter', with: 'plethora'
    click_button 'Refresh'
  elsif field == 'user'
    find('tr', text: 'Users').click_link 'Users'
    fill_in 'Filter', with: 'Linh'
    click_button 'Refresh'
  end
end

Then(/^I only see (.*?) that contain the word I searched for$/) do |field|
  if field == 'questions'
    page.all('tbody tr').each do |tr|
      expect tr.to_s.include?('plethora') == true
    end
  elsif field == 'users'
    page.all('tbody tr').each do |tr|
      expect tr.to_s.include?('Linh') == true
    end
  end
end

When (/^I fill in filter for question and click reset$/) do
  find('tr', text: 'Questions').click_link 'Questions'
  fill_in 'Filter', with: 'plethora'
  click_button 'Refresh'
  fill_in 'Filter', with: ''
  click_button 'Reset filters'
end

And(/^I remove the filter$/) do
  fill_in 'Filter', with: ''
  click_button 'Reset filters'
end

Then(/^I can see all the questions$/) do
  Question.all.each do |question|
    page.should have_content question.questions
  end
end


Then(/^I should not see the submit button$/) do
  expect(page).not_to have_content('Submit')
end
