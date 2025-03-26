# frozen_string_literal: true

class HomeController < ApplicationController
  #after_action :record_event
  before_action :authenticate_user!, only: [:user_home]

  def index
    if user_signed_in?
      redirect_to user_home_path
    end
  end

  def user_home
    @product = Product.first

  end

  private

  def record_event
    return if current_user.blank?

    GoogleRetailTagService.new(current_user).home_event
  end
end
