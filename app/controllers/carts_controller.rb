class CartsController < ApplicationController
  def index
    unless current_user
      debugger
      redirect_to user_session_path, alert: "you need to be signed in to view your cart"
      return
    end
    redirect_to order_url(get_user_basket)
  end
end
