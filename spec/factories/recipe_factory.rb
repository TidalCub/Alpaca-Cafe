FactoryBot.define do
  factory :recipe do
    product { association :product }
    ingredient_group { association :ingredient_group }
  end
end