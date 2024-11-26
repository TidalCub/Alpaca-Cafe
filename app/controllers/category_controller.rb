class CategoryController < ApplicationController
  before_action :authenticate_user!
  def index
    return redirect_to store_name_menu_index_url(current_user.basket.store.slug) if current_user.basket.store.present?

    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to manage_index_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
