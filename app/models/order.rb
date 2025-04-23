# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM
  include TrackableMetrics

  belongs_to :user
  belongs_to :store
  has_many :order_items, dependent: :destroy

  enum :state, { new_order: 0, pending: 1, on_checkout: 2, requires_capture: 3, processing: 4, paid: 5, payment_failed: 6, completed: 7, expired: 8 }

  aasm column: :state, enum: true do # rubocop:disable Metrics/BlockLength
    state :new_order, initial: true
    state :pending, :on_checkout, :paid, :completed, :expired, :payment_failed, :requires_capture, :processing

    event :pending do
      transitions from: %i[new_order pending on_checkout], to: :pending
    end

    event :checkout do
      transitions from: %i[new_order pending on_checkout], to: :on_checkout
      after do
        StripePaymentService.new(self).create_or_update
      end
    end

    event :requires_capture do
      transitions from: %i[on_checkout], to: :requires_capture
      after do
        OrderMailer.order_confirmation(self).deliver_now!
      end
    end

    event :check_in do
      transitions from: :requires_capture, to: :processing
      after do
        StripePaymentService.new(self).capture_payment
        OrderMailer.payment_confirmation(self).deliver_now!
        PrintReceiptService.new(self).send
      end
    end

    event :captured do
      transitions from: %i[requires_capture processing], to: :paid
    end

    event :complete do
      transitions from: :paid, to: :completed
      after do
        order_items.each do |order_item|
          GoogleRetailTagService.new(user).new_event('purchase-complete', order_item.product, 1)
        end
      end
    end

    event :expire do
      transitions from: %i[requires_capture processing], to: :expired
    end

    event :failed do
      transitions from: %i[on_checkout requires_capture processing], to: :payment_failed
    end
  end

  def total
    order_items.sum { |item| item.product.price }
  end

  def stripe_total_price
    (total * 100).to_i
  end
end
