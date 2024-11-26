class Store < ApplicationRecord
  has_one :address
  has_many :orders
  has_many :menus
  has_many :products, through: :menus
end
