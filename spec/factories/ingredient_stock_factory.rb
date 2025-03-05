# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient_stock do
    ingredient { association :ingredient }
    store { association :store }
    available { true }
  end
end
