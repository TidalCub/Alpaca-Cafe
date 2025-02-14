# frozen_string_literal: true

class HomeController < ApplicationController
  after_action :record_event
  def index
    @recommended_products = Product.order('RANDOM()').limit(1)
  end

  private

  def record_event
    return if current_user.blank?

    GoogleRetailTagService.new(current_user).home_event
  end
end
