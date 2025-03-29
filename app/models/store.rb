# frozen_string_literal: true

class Store < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :orders, dependent: :nullify
  has_many :product_stocks, dependent: :destroy
  has_many :products, through: :product_stocks, dependent: :nullify
  has_many :ingredient_stocks, dependent: :destroy
  has_many :ingredients, through: :ingredient_stocks, dependent: :nullify
end
