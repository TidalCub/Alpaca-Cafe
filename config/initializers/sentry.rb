# frozen_string_literal: true

Sentry.init do |config|
  config.breadcrumbs_logger = [:active_support_logger]
  config.dsn = Rails.application.credentials.dig(:sentry, :DNS)
  config.enable_tracing = true
  config.send_default_pii = true
end
