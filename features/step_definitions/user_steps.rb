def create_user
  @user ||= {first_name: 'Lily', last_name: 'Brown', email: 'lilybrown@gmail.com',
           password: 'lily1234', password_confirmation: 'lily1234', score: 0}
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
  click_on 'Log in'
  fill_in 'log_in_text1', with: @user[:email]
  fill_in 'log_in_text2', with: @user[:password]
  click_on 'Log in'
end

When /^I sign up with valid user details$/ do
  create_user
  sign_up
end

Then /^I should see a successful sign up message$/ do
  page.should have_content 'Welcome Lily! You have signed up successfully'
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
  @user = @user.merge(score: 1)
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
  page.should have_content 'Invalid Email or Password'
end


When(/^I log in with wrong password$/) do
  create_user
  @users = User.create(@user)
  @user = @user.merge(password: 'mac1234')
  log_in
end


When(/^I sign in on the login page using valid details$/) do
  create_user
  click_on 'Log in'
  sign_up_login
end


And(/^I am logged in$/) do
  create_user
  @users = User.create(@user)
  visit root_path
  log_in
end


When(/^I click on log out$/) do
  click_on 'Log out'
end


Then(/^I should see a sign out message$/) do
  page.should have_content 'Signed out successfully.'
end

When(/^I click on add question button without entering any details$/) do
  click_button 'Add this question'
end

When(/^I click on back to question button on add question form$/) do
  click_link 'Back to questions'
end


Then(/^I should be redirected to the questions page$/) do
  expect(current_path).to eq('/questions')
end


When(/^I log in on the sign up page with valid user credentials$/) do
  create_user
  @users = User.create(@user)
  click_button 'Sign up'
  click_link 'Log in'
  fill_in 'log_in_text1', with: @user[:email]
  fill_in 'log_in_text2', with: @user[:password]
  click_button 'Log in'
end

When(/^I log in as an admin$/) do
  @user ||= {first_name: 'admin', last_name: 'admin', email: 'admin@account.com',
             password: '123456', password_confirmation: '123456', admin: true}
  @users = User.create(@user)
  click_on 'Log in'
  fill_in 'log_in_text1', with: @user[:email]
  fill_in 'log_in_text2', with: @user[:password]
  click_on 'Log in'
end


When(/^I sign up with blank (.*?)$/) do |field|
  create_user
  case field
  when 'first name'
    @user = @user.merge(first_name: '')
  when 'last name'
    @user = @user.merge(last_name: '')
  when 'password'
    @user = @user.merge(password: '')
  when 'email'
    @user = @user.merge(email: '')
  end
  sign_up
end

Then(/^I should see a blank (.*?) error message$/) do |field|
  case field
  when 'first name'
    page.should have_content "First name can't be blank"
  when 'last name'
    page.should have_content "Last name can't be blank"
  when 'email'
    page.should have_content "Email can't be blank"
  when 'password'
    page.should have_content "Password can't be blank"
  end
end

Then(/^I should be directed to the admin site$/) do
  expect(current_path =='/admin' || current_path == '/admin/')
end


Then(/^I can see all the (.*?) in the database$/) do |field|
  if field == "question"
    find('tr', text: 'Questions').click_link 'Questions'
    Question.all.each do |question|
      page.should have_content question.questions
    end
  elsif field == 'user'
    find('tr', text: 'Users').click_link 'Users'
    User.all.each do |user|
      page.should have_content user.first_name
    end
  elsif  field == 'feedback'
    User.find_by_id(1).feedbacks.create(rating: 4, feedback_text: 'This is good')
    find('tr', text: 'Feedbacks').click_link 'Feedbacks'
    Feedback.all.each do |feedback|
      page.should have_content feedback.feedback_text
    end
  end
end

Then(/^I can delete any question from the database$/) do
  find('tr', text: 'Questions').click_link 'Questions'
  find('tr', text: 'wonderful means').click_link 'Delete'
  click_button "Yes, I'm sure"
  Question.all.each do |question|
    question.questions.should_not eql('wonderful means')
  end
end

Then(/^I can edit any question from the database$/) do
  find('tr', text: 'Questions').click_link 'Questions'
  find('tr', text: 'wonderful means').click_link 'Edit'
  fill_in 'Questions', with: 'The meaning of wonderful'
  click_button 'Save'
  expect Question.where(questions: 'The meaning of wonderful').exists? == true
  expect Question.where(questions: 'wonderful means').exists? == false
end

When(/^I click on (.*?) link$/) do |field|
  if field == 'Admin site'
    find('nav ul li', text: 'Home').click_link 'Home'
    click_on 'Admin Site'
  else
    find('nav ul li', text: field).click_link field
  end
end

And(/^the following users have been added to User Database:$/) do |user_table|
  user_table.hashes.each do |user|
    User.create(user)
  end
end

Then(/^I should be redirected to a feedback page$/) do
  expect(page).to have_current_path('/feedback')
end

And(/^I click on Submit feedback$/) do
  click_on 'Submit Feedback'
end

And(/^I fill in my feedback$/) do
  find('#star3').click
  fill_in 'feedback_text', with: 'This is a test comment'
  click_button 'Submit'
end

Then(/^my feedback should be saved in the database$/) do
  expect Feedback.count == 1
end

Then(/^the page should give error message if I don't give the rating$/) do
  click_button 'Submit'
  page.should have_content 'You need to give us the rating'
end


Then(/^I click on back to question button on feedback form$/) do
  click_link 'Back to questions'
end

And(/^I give a rating without a comment$/) do
  find('#star3').click
  click_button 'Submit'
end

Given /the following feedbacks have been added to the Feedback database:/ do |feedback_table|
  feedback_table.hashes.each do |feedback|
    Feedback.create(feedback)
  end
end

And /I go to submit feedback page/ do
  visit feedback_path
end

When /I click on show feedback button/ do
  click_link "Show Feedback"
end

Then /I should see 3 feedbacks on show feedback page/ do
  expect(page).to have_content("Feedback", "This app helps me al lot!")
  expect(page).to have_content("It lacks of instructions", "I hope I can see my own rank")
  page.all('tr').count.should == 4
end

And /I click on back button/ do
  click_link "Back"
end
