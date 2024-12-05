# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :ingredient_group
  has_many :product_modifyers, dependent: :destroy
  has_many :ingredient_stocks, dependent: :destroy
  has_many :products, through: :ingredient_group
end
