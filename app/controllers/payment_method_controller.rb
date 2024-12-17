
class PaymentMethodController < ApplicationController
  before_action :stripe_public_key
  
  def index
    @payment_methods = Stripe::PaymentMethod.list({
      customer: current_user.stripe_id
    })
    debugger
  end

  def new
    @setup_intent = SetupIntentService.new(current_user).new_intent
  end

  private

  def stripe_public_key
    @public_key = STRIPE_PUBLIC_KEY
  end
end
