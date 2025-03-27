# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find_by(slug: params[:store_name])
  end
end
