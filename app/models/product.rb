class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_item, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :store, through: :menu
  has_many :ingredient_groups, through: :recipes
  has_many :ingredients, through: :ingredient_groups
  has_many :ingredient_stocks, through: :ingredients
end
