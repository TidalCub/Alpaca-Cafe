# frozen_string_literal: true

module Admin
  module Availability
    class ProductsController < ApplicationController
      before_action :set_store
      before_action :authenticate_user!
      before_action :authorize_products

      def index
        @product_stocks_by_category = @store.product_stocks.includes(product: :category).group_by { |menu| menu.product.category }
      end

      def update
        params[:menu_items].each do |id, menu_item_available|
          product_stock = ProductStock.find(id)
          menu_item_available = menu_item_available == '1'
          product_stock.update(available: menu_item_available)
        end
        store = Store.find(params[:store_id])
        redirect_to store_name_product_availability_index_path(store_name: store.name), alert: 'Availability updated successfully.' # Rubocop:disable Rails/I18nLocaleTexts
      end

      private

      def set_store
        @store = Store.find_by(slug: params[:store_name]) || Store.find(params[:store_id])
        redirect_to root_path, notice: 'Store does not exist' if @store.nil? # Rubocop:disable Rails/I18nLocaleTexts
      end

      def authorize_products
        authorize! :product, with: Admin::Availability::ProductPolicy
      end
    end
  end
end
