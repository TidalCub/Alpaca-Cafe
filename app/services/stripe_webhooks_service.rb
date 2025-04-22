# frozen_string_literal: true

require 'stripe'

class StripeWebhooksService
  EventTypeMapping = {}
  def initialize(params)
    @params = params.with_indifferent_access
    @event = Stripe::Event.retrieve(params[:id])
    @order = Order.find_by(payment_intent: @event.data.object.id)
  end

  def process_event
    method_name = @event.type.parameterize.underscore.to_sym
    if respond_to?(method_name, true)
      send(method_name)
    else
      Rails.logger.warn "Unhandled event type: #{@event.type}"
    end
  end

  private

  def payment_intent_created
    Rails.logger.info "PaymentIntent was created!"
  end

  def payment_intent_succeeded
    Rails.logger.info "PaymentIntent was successful!"
  end

  def payment_intent_canceled
    @order.expire!
  end

  def charge_succeeded
    Rails.logger.info "Charge was successful!"
  end

  def charge_captured
    @order.captured!
  end

  def charge_expired
    @order.expire!
  end

  def charge_failed
    @order.failed!
  end

  def payment_intent_requires_action
    Rails.logger.info "PaymentIntent requires action!"
  end

  def payment_intent_payment_failed
    Rails.logger.info "PaymentIntent payment failed!"
  end

# Removed duplicate definition of `payment_intent_canceled`.

  def payment_method_attached
    Rails.logger.info "Payment method was attached!"
  end

  def payment_intent_amount_capturable_updated
    Rails.logger.info "PaymentIntent amount capturable updated!"
  end
end