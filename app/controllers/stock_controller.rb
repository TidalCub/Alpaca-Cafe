class StockController < ApplicationController
  def index
    @stores = Store.all
    @ingredient_group = IngredientGroup.all
  end

  def show
  end
end
