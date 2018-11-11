def create_user
  @user ||= {first_name: 'Lily', last_name: 'Brown', email: 'lilybrown@gmail.com',
           password: 'lily1234', password_confirmation: 'lily1234'}
end

def create_question
 @question ||= {questions: 'Ubiquitous means', answer: 'Omnipresent', option2: 'Absent',
              option3: 'Near', option4: 'escape', explanation: 'Present, appearing, or found everywhere'}
end

def add_question
  fill_in 'question_question', with: @question[:questions]
  fill_in 'question_option2', with: @question[:option2]
  fill_in 'question_option3', with: @question[:option3]
  fill_in 'question_option4', with: @question[:option4]
  fill_in 'question_answer', with: @question[:answer]
  fill_in 'question_explanation', with: @question[:explanation]
  click_button 'Add this question'
end

def sign_up_login
  click_link 'Sign up'
  fill_in 'sign_up_text1', with: @user[:first_name]
  fill_in 'sign_up_text2', with: @user[:last_name]
  fill_in 'sign_up_text3', with: @user[:email]
  fill_in 'sign_up_text4', with: @user[:password]
  fill_in 'sign_up_text5', with: @user[:password_confirmation]
  click_button 'Sign up'
end

def sign_up
  click_button 'Sign up'
  fill_in 'sign_up_text1', with: @user[:first_name]
  fill_in 'sign_up_text2', with: @user[:last_name]
  fill_in 'sign_up_text3', with: @user[:email]
  fill_in 'sign_up_text4', with: @user[:password]
  fill_in 'sign_up_text5', with: @user[:password_confirmation]
  click_button 'Sign up'
end

def log_in
  click_button 'Log in'
  fill_in 'log_in_text1', with: @user[:email]
  fill_in 'log_in_text2', with: @user[:password]
  click_button 'Log in'
end

When /^I sign up with valid user details$/ do
  create_user
  sign_up
end

Then /^I should see a successful sign up message$/ do
  page.should have_content 'Welcome Lily! You have signed up successfully'
end


When(/^I sign up with blank email$/) do
  create_user
  @user = @user.merge(email: '')
  sign_up
end

Then(/^I should see an blank email message$/) do
  page.should have_content "Email can't be blank"
end


When(/^I sign up with invalid password$/) do
  create_user
  @user = @user.merge(password: 'mac')
  sign_up
end

Then(/^I should see an invalid password message$/) do
  page.should have_content 'Password is too short (minimum is 6 characters)'
end


When(/^I sign up with blank password$/) do
  create_user
  @user = @user.merge(password: '')
  sign_up
end

Then(/^I should see a missing password message$/) do
  page.should have_content "Password can't be blank"
end

When(/^I sign up with with mismatched password and confirmation$/) do
  create_user
  @user = @user.merge(password_confirmation: 'mac1234')
  sign_up
end

Then(/^I should see an invalid password mismatch message$/) do
  page.should have_content "Password confirmation doesn't match Password"
end


When(/^I log in with valid user credentials$/) do
  create_user
  @users = User.create(@user)
  log_in
end

Then(/^I should see a successful login message$/) do
  page.should have_content 'Welcome back Lily!'
end


When(/^I log in with wrong email$/) do
  create_user
  @users = User.create(@user)
  @user = @user.merge(email: 'wrong@example.com')
  log_in
end

Then(/^I should see an invalid login message$/) do
  expect(page).to have_current_path('/users/sign_in')
end


When(/^I log in with wrong password$/) do
  create_user
  @users = User.create(@user)
  @user = @user.merge(password: 'mac1234')
  log_in
end


When(/^I sign in on the login page using valid details$/) do
  create_user
  click_button 'Log in'
  sign_up_login
end


And(/^I am logged in$/) do
  create_user
  @users = User.create(@user)
  visit root_path
  log_in
end


When(/^I click on log out$/) do
  click_button 'Log out'
end


Then(/^I should see a sign out message$/) do
  page.should have_content 'Signed out successfully.'
end


When(/^I click on add question with details$/) do
  create_question
  click_link 'Add question to the question bank'
  add_question
end

Then(/^I should get a successful message of adding a question$/) do
  page.should have_content 'Question successfully added to question bank'
end


When(/^I click on add question button without entering any details$/) do
  click_link 'Add question to the question bank'
  click_button 'Add this question'
end

Then(/^I should get a warning message$/) do
  page.should have_content 'All fields are required'
end
