# frozen_string_literal: true

class IngredientGroup < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :ingredients, through: :recipes, dependent: :destroy
end
