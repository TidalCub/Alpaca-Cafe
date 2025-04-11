class StripeWebhooksController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  before_action :log_webhooks
  #before_action :verify_stripe_signature, only: [:payment_intents]

  def payment_intents
    payload = request.body.read
  
    begin
      event = Stripe::Event.retrieve(params[:id])
      order = Order.find_by(payment_intent: event.data.object.id)
      print("event: #{event.inspect} \n\n #{event.type}\n\n")
  
      case event.type
      when 'payment_intent.created'
        logger.info "PaymentIntent was created!"
      when 'payment_intent.succeeded'
        logger.info "PaymentIntent was successful!"
        # order.check_in if order.present?
      when 'charge.succeeded'
        logger.info "Charge was successful!"
      when 'charge.captured'
        logger.info "Charge was captured!"
      when 'charge.failed'
        logger.info "Charge failed!"
      when 'payment_intent.requires_action'
        logger.info "PaymentIntent requires action!"
      when 'payment_intent.payment_failed'
        order.payment_failed if order.present?
      when 'payment_intent.canceled'
        order.payment_failed if order.present?
      end
  
      head :ok
    rescue Stripe::SignatureVerificationError => e
      logger.error "Stripe signature verification failed: #{e.message}"
      head :bad_request
    rescue ActiveRecord::RecordNotFound => e
      logger.error "Order not found: #{e.message}"
      head :not_found
    rescue StandardError => e
      logger.error "An error occurred: #{e.message}"
      head :internal_server_error
    end
  end

  private

  def log_webhooks
    logger.info "Received webhook with params: #{intent_params.inspect}"
  end

  def intent_params
    params.permit(:id, :object, :created, data: [ object: [:id, :amount, :amount]], metadata: [:order_id, :user_id, :store_id, :order_items])
  end

  def verify_stripe_signature
    sig_header = request.headers['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, :webhook_secret).to_s

    begin
      Stripe::Webhook.construct_event(request.body.read, sig_header, endpoint_secret)
    rescue Stripe::SignatureVerificationError => e
      logger.error "Stripe signature verification failed: #{e.message}"
      head :bad_request
    end
    rescue StandardError => e
      logger.error "An error occurred: #{e.message}"
      head :internal_server_error
  end
end
