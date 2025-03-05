# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :mqtt_log do
    topic { Faker::Book.title }
    message { Faker::Fantasy::Tolkien.poem }
    order { create(:order) }
  end
end
