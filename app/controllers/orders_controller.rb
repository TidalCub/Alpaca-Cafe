class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index 
    @orders = Order.all.paid
  end

  def show
    @order = Order.find(params[:id])
    unless @order.user == current_user
      redirect_to orders_path, alert: "You don't have permission to view this order."
    end
  end

  def cart
    @items = get_user_basket.order_items
    @total = calculate_total(get_user_basket)
    @recommended_products = Product.order("RANDOM()").limit(2)
  end

  def checkout
    @order = get_user_basket
    @total = calculate_total(get_user_basket)
  end

  def update
    @order = get_user_basket
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
