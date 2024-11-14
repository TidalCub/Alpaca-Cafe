class ProductController < ApplicationController
  skip_before_action :verify_authenticity_token
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
      render manage_index_path, alert: 'An Error occured, product has not been added'
    end
  end

  def add_to_basket
    basket = current_user.basket
    product = Product.find(add_to_basket_params[:product])
    order_item = OrderItem.create(order: basket, product_id: product.id)
    product_modifyer(params, order_item)
    redirect_back(fallback_location: categories_path)
  end

  private

  def product_modifyer(params, order_item)
    IngredientGroup.all.each do |ingredient_group|
      if params[ingredient_group.name].present? && !Ingredient.find(params[ingredient_group.name]).is_default
        ProductModifyer.create(order_item_id: order_item.id,
                               ingredient_id: Ingredient.find(params[ingredient_group.name]).id)
      end
    end
  end

  def add_to_basket_params
    params.permit(:product, :authenticity_token)
  end

  def product_params
    params.permit(:name, :price, :description, :category_id)
  end
end
