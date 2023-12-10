class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to manage_index_path
    else
      render manage_index_path,  alert: "An Error occured, product has not been added" 
    end
  end

  def add_to_basket
    product = Product.find(add_to_basket_params[:product])
    OrderItem.create(order: get_user_basket, product_id: product.id)
    redirect_back(fallback_location: categories_path)
  end

  private

  def add_to_basket_params
    params.permit(:product, :authenticity_token)
  end

  def product_params
    params.permit(:name, :price, :description, :category_id)
  end
end
