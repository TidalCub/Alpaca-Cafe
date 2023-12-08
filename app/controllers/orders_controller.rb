class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def cart
    @items = get_user_basket.order_items
  end

  def checkout
    @order = get_user_basket
  end

  def update
    @order = get_user_basket
    @order.state = 'paid'
    @order.save
    redirect_to @order
  end
end
