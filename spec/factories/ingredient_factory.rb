# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    name { 'Whole Milk' }
    ingredient_group { association :ingredient_group }
  end
end
