# frozen_string_literal: true

module Admin
  module Availability
    class IngredientsController < ApplicationController
      before_action :set_store
      before_action :authenticate_user!
      before_action :authorize_ingredients

      def index
        @ingredients_stock_by_group = @store.ingredient_stocks.includes(ingredient: :ingredient_group).group_by { |ingredient_stocks| ingredient_stocks.ingredient.ingredient_group }
      end

      def update
        params[:ingredient_stocks].each do |id, ingredient_stock|
          ingredient_stock_item = IngredientStock.find(id)
          ingredient_stock_availability = ingredient_stock == '1'
          ingredient_stock_item.update(available: ingredient_stock_availability)
        end
        store = Store.find(params[:store_id])
        redirect_to store_name_ingredient_availability_index_path(store_name: store.name), alert: 'Availability updated successfully.' # Rubocop:disable Rails/I18nLocaleTexts
      end

      private

      def set_store
        @store = Store.find_by(slug: params[:store_name])
      end

      def authorize_ingredients
        authorize! :ingredient, with: Admin::Availability::IngredientPolicy
      end
    end
  end
end
