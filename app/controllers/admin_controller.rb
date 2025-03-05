# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @store = Store.find_by(name: params[:store_name])
  end
end
