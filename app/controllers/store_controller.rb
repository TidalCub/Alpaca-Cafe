# frozen_string_literal: true

class StoreController < ApplicationController
  before_action :authenticate_user!
  def index
    @stores = Store.all
  end

  def select_store
    store = Store.find(params[:id])
    current_user.basket.update(store_id: store.id)
    redirect_to store_name_menu_index_url(store.slug)
  end

  def show
    @store = Store.find(params[:id])
  end
end
