class HomeController < ApplicationController
  def index
    @recommended_products = Product.order("RANDOM()").limit(5)
  end
end
