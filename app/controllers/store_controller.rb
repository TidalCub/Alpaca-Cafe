# frozen_string_literal: true

class StoreController < ApplicationController
  before_action :authenticate_user!

  def index
    @redirect = params[:redirect]
    @stores = Store.all
    authorize! @stores
  end

  def select_store
    store = Store.find(params[:id])
    authorize! store
    current_user.basket.update(store_id: store.id)
    if params[:redirect].present?
      product = Product.find(params[:redirect])
      redirect_to store_name_product_path(product.slug, store_name: store.slug)
    else
      redirect_to store_name_category_index_url(store_name: store.slug)
    end
  end

  def show
    @store = Store.find(params[:id])
    authorize! @store
  end
end
