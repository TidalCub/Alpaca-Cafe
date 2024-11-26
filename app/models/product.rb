class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_item, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :store, through: :menu
end
