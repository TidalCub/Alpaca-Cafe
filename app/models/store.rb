class Store < ApplicationRecord
  has_one :address
  has_many :orders
end
