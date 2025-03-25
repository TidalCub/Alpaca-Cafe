# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :store
  has_many :order_items, dependent: :destroy
  after_create :track_order_metrics

  enum :state, { new_order: 0, pending: 1, on_checkout: 2, requires_capture: 3, paid: 4, payment_failed: 5, completed: 6, expired: 7 }

  def total
    order_items.sum { |item| item.product.price }
  end
  aasm column: :state, enum: true do # rubocop:disable Metrics/BlockLength
    state :new_order, initial: true
    state :pending, :on_checkout, :paid, :completed, :expired, :payment_failed, :requires_capture

    event :pending do
      transitions from: %i[new_order pending on_checkout], to: :pending
    end

    event :checkout do
      transitions from: %i[new_order pending on_checkout], to: :on_checkout
      after do
        stripe_payment_intent = StripePaymentintentService.new(stripe_total_price, user, self)
        if payment_intent.present? && client_secret.present?
          stripe_payment_intent.update(payment_intent) if stripe_payment_intent.status != 'requires_capture'
        else
          payment_intent = stripe_payment_intent.create
          self.payment_intent = payment_intent.id
          self.client_secret = payment_intent.client_secret
          save
        end
      end
    end

    event :requires_capture do
      transitions from: %i[on_checkout], to: :requires_capture
      after do
        OrderMailer.order_confirmation(self).deliver_now!
      end
    end

    event :check_in do
      transitions from: :requires_capture, to: :paid
      after do
        stripe_payment_intent = StripePaymentintentService.new(nil, user, self)
        stripe_payment_intent.capture
        OrderMailer.payment_confirmation(self).deliver_now!
        PrintReceiptService.new(self).send
      end
    end

    event :complete do
      transitions from: :paid, to: :completed
      after do
        order_items.each do |order_item|
          GoogleRetailTagService.new(user).new_event('purchase-complete', order_item.product, 1)
        end
      end
    end
  end

  def stripe_total_price
    (total * 100).to_i
  end

  def track_order_metrics
    return unless Rails.env.production?

    prometheus_client = PrometheusExporter::Client.default

    prometheus_client.send_json(
      type: 'custom_order_metrics',
      labels: { status: state, store: store.name, created_at: created_at },
      creation_time: (Time.current - created_at).to_f
    )
  end
end
