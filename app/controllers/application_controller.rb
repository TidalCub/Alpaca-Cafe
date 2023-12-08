# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :allow_iframe_requests

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
  def get_user_basket
    current_user.orders.pending.any? ? current_user.orders.pending.last : Order.create(state: :pending, user: current_user)
  end
end
