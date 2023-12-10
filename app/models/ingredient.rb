class Ingredient < ApplicationRecord
  belongs_to :ingredient_group
  has_many :product_modifyers
end
