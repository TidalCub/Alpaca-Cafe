require 'stripe'

class PaymentsController < ApplicationController
  def create
    debugger
    @order = current_user.orders.last
    puts @order.payment_intent
    if @order
      StripePaymentintentService.new(nil, current_user, @order, payment_params["payment_method_id"]).confirm
    end
    redirect_to root_path
  end

  def show

  end

  private

  def payment_params
    params.require(:payment).permit(:payment_method_id)
  end
end
