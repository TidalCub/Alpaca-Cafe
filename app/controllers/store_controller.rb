class StoreController < ApplicationController
  def index
    @stores = Store.all
  end

  def select_store
    store = Store.find(params[:id])
    current_user.basket.update(store_id: store.id)
    redirect_to categories_path
  end
end
