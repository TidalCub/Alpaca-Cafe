Given('There is an order') do
  FactoryBot.create(:order)
end

Given('there are products') do
  FactoryBot.create(:product)
end

When('I go to the admin page') do
  visit admin_index_path
end

When('I click reporting') do
  click_on "Reporting"
end

Then('I see how many orders have been made') do
  expect(Order.count).to eq(1)
end

Then('I see how much have been made') do
  expect(page).to have_content("Total:")
end
