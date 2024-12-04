# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    state { 2 }
    user { association :user }
    store { association :store }
  end
end
