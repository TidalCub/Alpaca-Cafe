# frozen_string_literal: true

# if ENV["PROMETHEUS_ENABLED"] == "1" && ENV["IN_PUMA_WORKER"] == "1" && !Rails.env.test?
if Rails.env.production?
  require "prometheus_exporter/instrumentation"
  require "prometheus_exporter/middleware"
  require "prometheus_exporter/client"

  # This reports stats per request like HTTP status and timings
  Rails.application.middleware.unshift(PrometheusExporter::Middleware)

  # This reports per-process stats such as memory and GC info
  PrometheusExporter::Instrumentation::Process.start(type: "puma_worker")
  
  # This reports ActiveRecord connection pool metrics
  PrometheusExporter::Instrumentation::ActiveRecord.start(
    custom_labels: { type: "puma_worker" },
    config_labels: %i[database host]
  )

  if defined?(PrometheusExporter::Server::Collector)
    PrometheusExporter::Server::Collector.register_collector(PrometheusCustomCollector.new)
  end
  
  # Run prometheus `bundle exec prometheus_exporter --histogram` Or without `--histogram`

end
