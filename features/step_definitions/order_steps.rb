Given('I am loged in') do
  visit new_user_session_path
  fill_in 'user_email', with: "example@alpaca.com"
  fill_in 'user_password', with: "password"
  click_button 'Log in'
  expect(page).to have_content('Signed in successfully.')
end

When('I go to the menu page') do
  visit categories_path
end

Given('There is a product') do
  FactoryBot.create(:product)
end

Then('There is one product') do
  expect(Product.count).to eq(1)
end

Then('I can see it') do
  expect(page).to have_content(Product.first.name)
end

When('I order it') do
  click_on "Add to Order"
end

Then('I have one product') do
  expect(Order.first.order_items.count).to eq(1)
end

Given('There is a user') do
  FactoryBot.create(:user)
end

When('I go to my cart') do
  visit cart_path
end

Then('I click {string}') do |string|
  click_on string
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

When('Chose {string}') do |string|
  div_element = find('.btn', text: string)
  div_element.click
end

Then('I have one product with {string}') do |string|
  
  expect(Order.first.order_items.first.product_modifyers.first.ingredient.name).to eq(string)
end