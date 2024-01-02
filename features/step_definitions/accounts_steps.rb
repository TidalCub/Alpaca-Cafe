Given('I am on the sign up page') do
  visit new_user_session_path
  click_link 'Sign up'
end

When('I fill in the sign up form with valid credentials') do
  password = Faker::Internet.password
  fill_in 'user_email', with: Faker::Internet.email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
end

Then('I should see a success message') do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end

Given('I am on the login page') do
  visit new_user_session_path
end

Given('I have a user account') do
  @user = FactoryBot.create(:user)
end

When('I fill in the login form with valid credentials') do
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: "password"
  click_button 'Log in'
end

Then('I should be redirected to the home page') do
  expect(page).to have_current_path(root_path)
end

Then('I should see a welcome message') do
  expect(page).to have_content('Signed in successfully.')
end

Given('I am on my account page') do
  visit '/account'
end

When('I should see a {string} message') do |string|
  expect(page).to have_content(string)
end

When('I fill in the login form with invalid credentials') do
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: 'ef'
  click_button 'Log in'
end

Then('I should see an error message') do
  expect(page).to have_content('Invalid Email or password.')
end

When('I fill in the sign up form with invalid credentials') do
  fill_in 'user_email', with: Faker::Internet.email
  fill_in 'user_password', with: 'ef'
  fill_in 'user_password_confirmation', with: 'ef'
end

Then('I should see my profile information') do
  expect(page).to have_content(@user.email)
end

When('I should see my previous orders') do
  expect(page).to have_content('Past Orders')
end