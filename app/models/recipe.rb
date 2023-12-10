class Recipe < ApplicationRecord
  belongs_to :ingredient_group
  belongs_to :product
end
