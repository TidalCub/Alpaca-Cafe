class StripeWebhooksController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  before_action :log_webhooks
  #before_action :verify_stripe_signature, only: [:payment_intents]

  def payment_intents
    if StripeWebhooksService.new(params).process_event
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def log_webhooks
    logger.info "Received webhook with params: #{params.inspect}"
  end
end
