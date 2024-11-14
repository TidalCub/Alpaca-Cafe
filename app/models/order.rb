class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  enum :state, { pending: 0, paid: 1, completed: 2 }

  def total
    order_items.sum { |item| item.product.price }
  end
end
