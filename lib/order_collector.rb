# frozen_string_literal: true

require "prometheus_exporter/instrumentation"
require "prometheus_exporter/middleware"
require "prometheus_exporter/client"


class OrderCollector < PrometheusExporter::Server::TypeCollector
  def initialize
    @order_counter = PrometheusExporter::Metric::Counter.new('orders_created', 'Number of orders created')
    super
  end

  def type
    'custom_order_metrics'
  end

  def collect(obj)
    @order_counter.observe(1, obj['labels'])
  end

  def metrics
    [@order_counter]
  end
end
