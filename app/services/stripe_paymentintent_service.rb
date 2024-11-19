require 'stripe'

class StripePaymentintentService
  def initialize(amount, current_user, booking)
    @amount = amount
    @current_user = current_user
    @booking = booking
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

  private

  def create_params
    {
      amount: @amount,
      currency: 'gbp',
      receipt_email: @booking.user.email,
      automatic_payment_methods: { enabled: true }
    }.compact
  end

  def update_params
    {
      amount: @amount,
      currency: 'gbp',
      receipt_email: @booking.user.email
    }.compact
  end
end
