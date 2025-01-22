class Admin::Availability::ProductsController < ApplicationController
  before_action :set_store

  def index
    @menus_by_category = @store.menus.includes(product: :category).group_by { |menu| menu.product.category }
  end

  def update
  end

  private

  def set_store
    @store = Store.find_by(name: params[:store_name])
  end
end
