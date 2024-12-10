Stripe.api_key = Rails.application.credentials.dig(:development, :stripe, :secret_key)
