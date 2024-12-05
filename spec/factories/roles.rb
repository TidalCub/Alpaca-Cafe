FactoryBot.define do
  factory :role do
    name { Faker::Name.name }
    UUID { '' }
  end
end
