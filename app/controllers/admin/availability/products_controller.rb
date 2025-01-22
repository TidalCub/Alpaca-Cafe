module Admin
  module Availability
    class ProductsController < ApplicationController
      before_action :set_store

      def index
        @menus_by_category = @store.menus.includes(product: :category).group_by { |menu| menu.product.category }
      end

      def update
        params[:menu_items].each do |id, menu_item_available|
          menu_item = Menu.find(id)
          menu_item_available = menu_item_available == '1'
          menu_item.update(available: menu_item_available)
        end
        store = Store.find(params[:store_id])
        redirect_to store_name_products_path(store_name: store.name), alert: 'Availability updated successfully.'
      end

      private

      def set_store
        @store = Store.find_by(name: params[:store_name])
      end
    end
  end
end
