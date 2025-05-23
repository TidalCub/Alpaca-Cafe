# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    transient do
      role_name { 'customer' }
      uuid { 'customer' }
    end

    after(:create) do |user, evaluator|
      role = Role.find_or_create_by(uuid: evaluator.role_name)
      user.add_role(role.id)
    end
  end
end
