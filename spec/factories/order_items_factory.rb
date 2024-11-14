require 'faker'

FactoryBot.define do
  factory :order_item do
    order { create(:order) }
    product { create(:product) }
    quantity { Faker::Number.number(digits: 1) }
  end
end
