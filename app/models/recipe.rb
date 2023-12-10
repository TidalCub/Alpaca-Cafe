class Recipe < ApplicationRecord
  has_many :ingredient_groups
  belongs_to :product
end
