Given('There is a Product and Catagory') do
  FactoryBot.create(:product)
end

When('I go to the menu page') do
  visit categories_path
end

Then('I see the product in the right catagory') do
  expect(page).to have_content("Category")
end

Given('There is a Product') do
  FactoryBot.create(:product)
end

When('I change the price') do
  Product.last.price = 5.99
end

Then('The price is saved') do
  expect(Product.last.price).to eq (0.999e1) # Rails formates numbers wierdly
end

Then('I can see the new price') do
  expect(Product.last.price).to eq (0.999e1)
end