class OrdersController < ApplicationController
  def show
    @items = current_user.orders.pending.last.order_items
  end
end
