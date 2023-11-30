class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      
      redirect_to manage_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end