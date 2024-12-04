# frozen_string_literal: true

class Store < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :orders, dependent: :nullify
  has_many :menus, dependent: :destroy
  has_many :products, through: :menus, dependent: :nullify
  has_many :ingredient_stocks, dependent: :destroy
  has_many :ingredients, through: :ingredient_stocks, dependent: :nullify
end
