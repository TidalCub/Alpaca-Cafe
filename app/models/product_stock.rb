# frozen_string_literal: true

class ProductStock < ApplicationRecord
  belongs_to :store
  belongs_to :product
  has_many :ingredients, through: :product
  has_many :ingredient_stocks, through: :store
end
