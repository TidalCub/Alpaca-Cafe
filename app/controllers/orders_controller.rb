class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.all.paid
  end

  def show
    @order = Order.find(params[:id])
    return if @order.user == current_user

    redirect_to orders_path, alert: "You don't have permission to view this order."
  end

  def cart
    @items = current_user.basket.order_items
    @total = current_user.basket.total
    @recommended_products = Product.order('RANDOM()').limit(2)
  end

  def checkout
    @order = current_user.basket
    @total = current_user.basket.total
  end

  def update
    @order = current_user.basket
    @order.state = 'paid'
    @order.save
    redirect_to @order
  end

  def complete_order
    @order = Order.find(params[:id])
    @order.state = 'completed'
    @order.save
    redirect_to orders_path
  end
end
