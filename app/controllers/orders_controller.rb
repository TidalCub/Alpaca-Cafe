# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :stripe_public_key, only: :checkout
  before_action :payment_methods, only: :checkout

  def index
    @orders = Order.all.paid
    authorize! @orders
  end

  def show
    @order = Order.find(params[:id])
    authorize! @order
    #redirect_to orders_path, alert: t('orders.alerts.no_permission')
  end

  def check_in
    @order = Order.find(params[:id])
    
  end

  def cart
    basket = current_user.basket
    authorize! basket
    @items = basket.order_items
    @total = basket.total
    @recommended_products = Product.order('RANDOM()').limit(2)
  end

  def checkout
    @order = current_user.orders.last
    redirect_to order_path(@order) if @order.state == "requires_capture"
    @customer_session_client_secret = CustomerSessionService.new(current_user).create_session.client_secret
    @payment = Payment.new
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

  private

  def stripe_public_key
    @public_key = STRIPE_PUBLIC_KEY
  end

  def payment_methods
    @payment_methods = PaymentMethodService.new(current_user).list
  end
end
