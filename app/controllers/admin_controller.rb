# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    @orders = Order.all
  end
end
