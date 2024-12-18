# frozen_string_literal: true

require 'stripe'

class StripePaymentintentService
  def initialize(amount, current_user, order)
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

  def retrieve
    
  end

  def create_params
    {
      amount: @amount,
      currency: 'gbp',
      receipt_email: @order.user.email,
      customer: @order.user.stripe_id,
      automatic_payment_methods: { enabled: true },
      setup_future_usage: 'off_session',
      capture_method: 'manual'
    }.compact
  end

  def update_params
    {
      amount: @amount,
      currency: 'gbp',
      receipt_email: @order.user.email,
      payment_method: @payment_method
    }.compact
  end
end
