# frozen_string_literal: true

# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { 'This is a test product' }
    price { 9.99 }
    category { association :category }
    image { 'chai_tea_image.png' }
    after(:create) do |product|
      create(:recipe, product: product)
    end
  end
end
