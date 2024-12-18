# frozen_string_literal: true

require 'stripe'

class PaymentMethodService
  def initialize(user)
    @user = user
  end

  def list
    Stripe::Customer.list_payment_methods(@user.stripe_id)
  end
end
