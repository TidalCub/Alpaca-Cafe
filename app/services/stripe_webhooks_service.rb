# frozen_string_literal: true

require 'stripe'

class StripeWebhooksService
  EventTypeMapping = {}
  def initialize(params)
    @params = params.with_indifferent_access
    @event = Stripe::Event.retrieve(params[:id])
    @order = Order.find_by(payment_intent: event.data.object.id)
    print("event: #{event.inspect} \n\n #{event.type}\n\n")
  end

  def process_event
    method_name = event_type.parameterize.underscore.to_sym
    if respond_to?(method_name, true)
      send(method_name)
    else
      logger.warn "Unhandled event type: #{event.type}"
    end
  end

  private

  def payment_intent_created
    logger.info "PaymentIntent was created!"
  end

  def payment_intent_succeeded
    logger.info "PaymentIntent was successful!"
  end

  def charge_succeeded
    logger.info "Charge was successful!"
  end

  def charge_captured
    logger.info "Charge was captured!"
  end

  def charge_failed
    logger.info "Charge failed!"
  end

  def payment_intent_requires_action
    logger.info "PaymentIntent requires action!"
  end

  def payment_intent_payment_failed
    logger.info "PaymentIntent payment failed!"
  end

  def payment_intent_canceled
    logger.info "PaymentIntent was canceled!"
  end
end