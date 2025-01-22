# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    product { association :product }
    store { association :store }
    available { true }
  end
end
