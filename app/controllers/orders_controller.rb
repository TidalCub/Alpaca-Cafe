# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :stripe_public_key, only: :checkout

  def index
    @orders = Order.all.paid
    authorize! @orders
  end

  def show
    @order = Order.find(params[:id])
    redirect_to check_in_order_path(@order) if @order.state == 'requires_capture'
    authorize! @order
    # redirect_to orders_path, alert: t('orders.alerts.no_permission')
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
    @order = current_user.basket
    authorize! @order
    validate_basket(@order)
    @customer_session_client_secret = CustomerSessionService.new(current_user).create_session.client_secret
    @payment = Payment.new
    @total = current_user.basket.total
    @order.checkout!
  end

  def update
    @order = Order.find(update_params['id'])
    redirect_to index_path unless @order.user == current_user
    @order.check_in! if update_params['action_type'] == 'check_in'
    redirect_to order_path(@order)
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

  def update_params
    params.permit(:action_type, :id)
  end

  def validate_basket(basket)
    if basket.order_items.empty?
      redirect_to cart_path
    elsif @order.state == 'requires_capture'
      redirect_to order_path(@order)
    end
  end
end
