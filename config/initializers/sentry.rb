# frozen_string_literal: true

unless Rails.env.local?
  Sentry.init do |config|
    config.breadcrumbs_logger = [:active_support_logger]
    config.dsn = Rails.application.credentials.dig(:sentry, :DNS)
    config.traces_sample_rate = 1.0
    config.profiles_sample_rate = 1.0
    config.enable_tracing = true
    config.send_default_pii = true
  end  
end

  