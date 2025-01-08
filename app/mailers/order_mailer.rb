# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'leon@leon-skinner.dev'

  def order_confirmation(order)
    @order = order
    bootstrap_mail(
      to: @order.user.email,
      subject: 'Order Confirmation'
    )
  end

  def payment_confirmation(order)
    @order = order
    bootstrap_mail(
      to: @order.user.email,
      subject: 'Order Confirmation'
    )
  end

  def failed_payment(order)
    @order = order
    bootstrap_mail(
      to: @order.user.email,
      subject: 'Order Confirmation'
    )
  end
end
