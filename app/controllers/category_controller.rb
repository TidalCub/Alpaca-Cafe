# frozen_string_literal: true

class CategoryController < ApplicationController
  before_action
  def index
    # return redirect_to store_name_menu_index_url(current_user.basket.store.slug) if user_signed_in? && current_user.basket.store.present?

    current_user.basket.pending! if current_user.present?
    @categories = Category.all
  end

  def show
    @store = Store.find_by(slug: params[:store_name].downcase)
    @category = Category.find_by(name: params[:category_name])
    @menu_items = @category.product_stocks.where(store: @store)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to manage_index_path, notice: t('notices.category.created')
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
