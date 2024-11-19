class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :product_modifyers, dependent: :destroy
end
