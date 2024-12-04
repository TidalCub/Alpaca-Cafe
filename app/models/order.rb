# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :store
  has_many :order_items, dependent: :destroy

  enum :state, { new_order: 0, pending: 1, on_checkout: 2, paid: 3, payment_failed: 4, completed: 5, expired: 6 }

  def total
    order_items.sum { |item| item.product.price }
  end

  aasm column: :state, enum: true do
    state :new_order, initial: true
    state :pending, :on_checkout, :paid, :completed, :expired, :payment_failed

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :complete do
      transitions from: :paid, to: :completed
    end
  end
end
