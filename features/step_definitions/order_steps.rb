Given('There is an item') do
  FactoryBot.create(:product)
end

Given('Im on the menu page') do
  visit categories_path
end

When('I click {string}') do |string|
  click_on string
end

Then('I should see the item in my Cart') do
  expect(page).to have_content(Product.last.name)
end

Then('I should see the checkout page') do
  expect(page).to have_content("Checkout")
end

Then('I should see the order confirmation page') do
  expect(page).to have_content("Your Order Number is:")
end

Given('There is a user') do
  FactoryBot.create(:user)
end

Given('I am logged in') do
  click_on "Sign In"
  fill_in "Email", with: "example@alpaca.com"
  fill_in "Password", with: "password"
  click_on "Log in"
end

Then('The order should have the status {string}') do |string|
  expect(Order.last.state).to eq(string)
end

Then('I cant see {string}') do |string|
  expect(page).to_not have_content(string)
end

Then('I should see the ingridients i can change') do
  expect(page).to have_content("Customise your product")
end

When('I change the {string} to {string}') do |string, string2|
  click_on Ingredient.where(name: string2).id
end

Then('I should see the {string} in the ingridients') do |string|
  expect(page).to have_content(string)
end
