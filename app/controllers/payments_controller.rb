require 'stripe'

class PaymentsController < ApplicationController
  before_action :find_order

  def create

  end

  def index
    stripe_status = StripePaymentintentService.new(nil, current_user, @order).status
    @order.requires_capture! if stripe_status =="requires_capture"

    redirect_to check_in_order_path(@order)
  end

  def show

  end

  private

  def find_order
    @order = Order.find_by(payment_intent: payment_params["payment_intent"])
    redirect_to index_path unless @order.user == current_user || @order.present?
  end

  def payment_params
    params.permit("payment_intent")
  end
end
