require 'opentelemetry/sdk'
require 'opentelemetry/instrumentation/all'

ENV['OTEL_TRACES_EXPORTER'] = 'console'
OpenTelemetry::SDK.configure do |c|
  c.service_name = 'alpaca-cafe'
  c.use_all()
end