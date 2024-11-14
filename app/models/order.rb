class Order < ApplicationRecord
  include AASM
  belongs_to :user
  has_many :order_items

  enum :state, { pending: 0, paid: 1, completed: 2 }

  def total
    order_items.sum { |item| item.product.price }
  end

  aasm column: :state, enum: true do
    state :pending, initial: true
    state :paid, :completed

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :complete do
      transitions from: :paid, to: :completed
    end
  end
end
