# frozen_string_literal: true

require 'stripe'

class StripePaymentintentService
  def initialize(amount = nil, current_user = nil, order)
    @amount = amount
    @current_user = current_user
    @order = order
  end

  def create
    Stripe::PaymentIntent.create(create_params)
  end

  def update(payment_intent_id)
    Stripe::PaymentIntent.update(
      payment_intent_id,
      update_params
    )
  end

  def status
    Stripe::PaymentIntent.retrieve(
      @order.payment_intent
    ).status
  end

  def capture
    Stripe::PaymentIntent.capture(
      @order.payment_intent
    )
  end

  private

  def retrieve; end

  # rubocop:disable Metrics/MethodLength
  def create_params
    {
      amount: @amount,
      currency: 'gbp',
      receipt_email: @order.user.email,
      customer: @order.user.stripe_id,
      automatic_payment_methods: { enabled: true },
      setup_future_usage: 'off_session',
      capture_method: 'manual',
      metadata: {
        order_id: @order.id,
        user_id: @current_user.id,
        store_id: @order.store.id,
        order_items: (@order.order_items.map { |item| { product_id: item.product.id } }).to_s
      }
    }.compact
  end
  # rubocop:enable Metrics/MethodLength

  def update_params
    {
      amount: @amount,
      currency: 'gbp',
      receipt_email: @order.user.email
    }.compact
  end
end
