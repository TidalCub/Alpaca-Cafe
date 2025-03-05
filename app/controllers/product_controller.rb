# frozen_string_literal: true

class ProductController < ApplicationController
  before_action :set_store
  before_action :set_product, only: %i[show]
  before_action :authorize!
  # after_action :record_view_event, only: %i[show]
  # after_action :record_basket_add_event, only: %i[add_to_basket]

  def index
    @products = Product.all
  end

  def show
    @ingredients = @product.ingredient_stocks.where(store_id: @store).group_by(&:ingredient_group)
  end

  def create
    @product = Product.new(product_params)
    authorize! @product
    if @product.save
      redirect_to manage_index_path
    else
      render manage_index_path, alert: 'An Error occured, product has not been added'
    end
  end

  def add_to_basket
    product = Product.find(add_to_basket_params[:product])
    order_item = current_user.basket.order_items.create(product_id: product.id)
    product_modifyer(params, order_item)
    redirect_back(fallback_location: categories_path)
  end

  private

  def product_modifyer(params, order_item)
    IngredientGroup.find_each do |ingredient_group|
      order_item.product_modifyers.create(ingredient_id: Ingredient.find(params[ingredient_group.name]).id) if params[ingredient_group.name].present? && !Ingredient.find(params[ingredient_group.name]).is_default
    end
  end

  def add_to_basket_params
    params.permit(:product, :authenticity_token)
  end

  def product_params
    params.permit(:name, :price, :description, :category_id)
  end

  def set_store
    @store = Store.find_by(slug: params[:store_name])
  end

  def set_product
    @product = Product.find_by(slug: params[:product_name].parameterize)
  end

  def record_view_event
    GoogleRetailTagService.new(current_user).new_event('detail-page-view', @product)
  end

  def record_basket_add_event
    product = Product.find(add_to_basket_params[:product])
    GoogleRetailTagService.new(current_user).new_event('add-to-cart', product, 1)
  end
end
