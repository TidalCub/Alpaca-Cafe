class StripeWebhooksController < ApplicationController
  before_action :verify_stripe_signature
  before_action :log_webhooks

  def payment_intents
    if StripeWebhooksService.new(params).process_event
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def log_webhooks
    WebhookLog.create(event_params: params.to_json.to_s)
  end

  def verify_stripe_signature
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = ENV['STRIPE_ENDPOINT_SECRET']

    begin
      Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue Stripe::SignatureVerificationError
      head :unauthorized
    end
  end
end
