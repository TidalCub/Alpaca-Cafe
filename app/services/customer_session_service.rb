require 'stripe'

class CustomerSessionService
  def initialize(user)
    @user = user
  end

  def create_session
    Stripe::CustomerSession.create({
      customer: @user.stripe_id,
      components: { payment_element: { enabled: true } },
    })
  end
end