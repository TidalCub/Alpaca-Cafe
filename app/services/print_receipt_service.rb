class PrintReceiptService
  def initialize(order)
    @order = order
  end

  def send
    CLIENT.publish("printer", payload, retain = false)
  end

  private

  def payload
    {
      order_id: @order.id,
      total: @order.total,
      items: @order.order_items.map do |item|
        {
          name: item.product.name,
          quantity: item.quantity,
          price: item.product.price
        }
      end,
      order_details: {
        started_at_time: @order.created_at,
        last_updated_at_time: @order.updated_at,
        store: @order.store.name
      }
    }.to_json
  end
end
