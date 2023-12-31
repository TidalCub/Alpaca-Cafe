# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { "Test Product" }
    description { "This is a test product" }
    price { 9.99 }
    category { association :category }
    after(:create) do |product|
      create(:recipe, product: product)
    end
  end
  
end