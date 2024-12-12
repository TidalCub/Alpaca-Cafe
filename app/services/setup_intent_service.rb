require 'stripe'
class SetupIntentService
  def initialize(user)
    @user = user
  end

  def new_intent
    Stripe::SetupIntent.create(
      automatic_payment_methods: {
        enabled: true,
    },
    customer: @user.stripe_id
    )
  end
end
