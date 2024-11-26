class Store < ApplicationRecord
  has_one :address
  has_many :orders
  has_many :menus
  has_many :products, through: :menus
  has_many :ingredient_stocks
  has_many :ingredients, through: :ingredient_stocks
end
