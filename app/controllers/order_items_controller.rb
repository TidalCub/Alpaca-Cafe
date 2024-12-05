# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to checkout_path
  end
end
