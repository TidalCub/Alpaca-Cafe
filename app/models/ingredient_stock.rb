class IngredientStock < ApplicationRecord
  belongs_to :ingredient
  belongs_to :store
  has_one :ingredient_group, through: :ingredient
end
