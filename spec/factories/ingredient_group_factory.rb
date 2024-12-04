# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient_group do
    name { 'Milk' }
    after(:create) do |ingredient_group|
      create(:ingredient, name: 'Whole Milk', ingredient_group:, is_default: true)
      create(:ingredient, name: 'Oat Milk', ingredient_group:)
    end
  end
end
