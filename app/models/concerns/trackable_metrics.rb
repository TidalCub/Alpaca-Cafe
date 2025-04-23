# frozen_string_literal: true

module TrackableMetrics
  extend ActiveSupport::Concern

  included do
    after_create :track_order_metrics
  end

  private

  def track_order_metrics
    return unless Rails.env.production?

    prometheus_client = PrometheusExporter::Client.default
    prometheus_client.send_json(
      type: 'custom_order_metrics',
      labels: { status: state, store: store.name, created_at: created_at },
      creation_time: (Time.current - created_at).to_f
    )
  end
end
