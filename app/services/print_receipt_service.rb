# frozen_string_literal: true


class PrintReceiptService < MqttService
  def initialize(order) 
    @order = order
  end

  def send
    super("printer", payload, @order)
  end

  private

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def payload
    {
      order_id: @order.id,
      total: @order.total,
      items: @order.order_items.map do |item|
        {
          name: item.product.name,
          quantity: item.quantity,
          price: item.product.price,
          modifiers: item.product_modifyers.map do |modifier|
            {
              ingredient_group: modifier.ingredient.ingredient_group.name,
              name: modifier.ingredient.name
            }
          end
        }
      end,
      order_details: {
        started_at_time: @order.created_at,
        last_updated_at_time: @order.updated_at,
        store: @order.store.name
      }
    }.to_json
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end  

