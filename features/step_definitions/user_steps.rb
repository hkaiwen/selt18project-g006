def create_user
  @user ||= {first_name: 'Lily', last_name: 'Brown', email: 'lilybrown@gmail.com',
           password: 'lily1234', password_confirmation: 'lily1234'}
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

When(/^I click on add question button without entering any details$/) do
  click_button 'Add this question'
end

When(/^I click on back to question button on add question form$/) do
  click_link 'Back to questions'
end


Then(/^I should be redirected to the questions page$/) do
  expect(current_path).to eq('/questions')
end




