# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :order_item, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :product_stocks, dependent: :destroy
  has_many :store, through: :menu
  has_many :ingredient_groups, through: :recipes
  has_many :ingredients, through: :ingredient_groups
  has_many :ingredient_stocks, through: :ingredients
  after_create :create_slug

  def create_slug
    update(slug: name.parameterize)
  end
end
