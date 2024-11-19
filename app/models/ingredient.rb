class Ingredient < ApplicationRecord
  belongs_to :ingredient_group
  has_many :product_modifyers
  has_many :stocks, dependent: :destroy
end
