def create_user
  @user||={first_name: 'Lily', last_name: 'Brown', email: 'lilybrown@gmail.com',
           password: 'lily1234', password_confirmation: 'lily1234'}
end

def sign_up
  #click_button 'Sign up'
  visit '/users/sign_up'
  fill_in 'sign_up_text1', with: @user[:first_name]
  fill_in 'sign_up_text2', with: @user[:last_name]
  fill_in 'sign_up_text3', with: @user[:email]
  fill_in 'sign_up_text4', with: @user[:password]
  fill_in 'sign_up_text5', with: @user[:password_confirmation]
  @@count = 0
  @@tot_ques = []
  click_button 'Sign up'
end


When /^I sign up with valid user details$/ do
  create_user
  sign_up
end

Then /^I should see a successful sign up message$/ do
  page.should have_content 'Welcome! You have signed up successfully.'
end


When(/^I sign up with invalid email$/) do
  create_user
  @user = @user.merge(:email => 'wrongexample.com')
  sign_up
end

Then(/^I should see an invalid email message$/) do
  page.should have_content 'Email is invalid'
end
