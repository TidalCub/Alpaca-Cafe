class Menu < ApplicationRecord
  belongs_to :store
  belongs_to :product
  has_many :ingredients, through: :product
  has_one :category, through: :product
  has_many :ingredient_stocks, through: :ingredients
  has_many :ingredient_stocks, through: :store
end
