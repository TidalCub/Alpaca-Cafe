# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    state { 1 }
    user { association :user }
    store { association :store }
  end
end
