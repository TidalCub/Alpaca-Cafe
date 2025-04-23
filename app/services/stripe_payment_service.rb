# frozen_string_literal: true

class StripePaymentService
  def initialize(order)
    @order = order
    @user = order.user
  end

  def create_or_update
    if @order.payment_intent.present? && @order.client_secret.present?
      update_payment_intent
    else
      create_payment_intent
    end
  end

  def create_payment_intent
    stripe_payment_intent = StripePaymentintentService.new(@order.stripe_total_price, @user, @order)
    payment_intent = stripe_payment_intent.create
    @order.update(payment_intent: payment_intent.id, client_secret: payment_intent.client_secret)
  end

  def update_payment_intent
    stripe_payment_intent = StripePaymentintentService.new(@order.stripe_total_price, @user, @order)
    stripe_payment_intent.update(@order.payment_intent) if stripe_payment_intent.status != 'requires_capture'
  end

  def capture_payment
    stripe_payment_intent = StripePaymentintentService.new(nil, @user, @order)
    stripe_payment_intent.capture
  end
end
