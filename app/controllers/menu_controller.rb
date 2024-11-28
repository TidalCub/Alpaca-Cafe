class MenuController < ApplicationController
  before_action :authenticate_user!
  before_action :store
  def index
    @products_by_category = @store.menus.group_by(&:category)
  end

  private

  def store
    @store = Store.find_by(slug: params[:store_name].downcase)
    if @store.nil?
      redirect_to root_path if @store.nil?
    elsif current_user.basket.store_id != @store.id
      redirect_to store_name_menu_index_url(@store.name)
    end
  end
end
