# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.all.paid
    authorize! @orders
  end

  def show
    @order = Order.find(params[:id])
    authorize! @order

    redirect_to orders_path, alert: t('orders.alerts.no_permission')
  end

  def cart
    basket = current_user.basket
    authorize! basket
    @items = basket.order_items
    @total = basket.total
    @recommended_products = Product.order('RANDOM()').limit(2)
  end

  def checkout
    @order = current_user.basket
    authorize! @order
    @total = current_user.basket.total
    @order.checkout!
  end

  def update
    @order = current_user.basket
    authorize! @order
    @order.paid!
    redirect_to @order
  end

  def complete_order
    @order = Order.find(params[:id])
    authorize! @order
    @order.complete!
    redirect_to orders_path
  end
end
