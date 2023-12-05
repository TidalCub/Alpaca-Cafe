class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to manage_index_path
    else
      render manage_index_path,  alert: "An Error occured, product has not been added" 
    end
  end

  private

  def product_params
    params.permit(:name, :price, :description, :category_id)
  end
end
