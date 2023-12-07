# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def get_user_basket
    current_user.orders.pending.any? ? current_user.orders.pending.last : Order.create(state: :pending, user: current_user)
  end
end
