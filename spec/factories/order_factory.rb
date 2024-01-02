FactoryBot.define do
  factory :order do
    state { 2 }
    user { association :user }

  end
end
