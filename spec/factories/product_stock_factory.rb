# frozen_string_literal: true

FactoryBot.define do
  factory :product_stock do
    product { association :product }
    store { association :store }
    available { true }
  end
end
