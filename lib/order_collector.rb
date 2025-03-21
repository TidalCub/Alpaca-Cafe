# frozen_string_literal: true

class OrderCollector < PrometheusExporter::Server::TypeCollector
  def initialize
    @order_counter = PrometheusExporter::Metric::Counter.new("orders_created", "Number of orders created")
  end

  def type
    "custom_order_metrics"
  end

  def collect(obj)
    @order_counter.observe(1, obj["labels"])
  end

  def metrics
    [@order_counter]
  end
end
