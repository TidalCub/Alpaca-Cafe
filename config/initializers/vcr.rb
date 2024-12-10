# frozen_string_literal: true

VCR.configure do |vcr_config|
  vcr_config.cassette_library_dir = 'fixtures/vcr_cassettes'
  vcr_config.hook_into :webmock
  vcr_config.filter_sensitive_data('<stripe_secret>') { Rails.application.credentials.dig(:development, :stripe, :secret_key) }
end
