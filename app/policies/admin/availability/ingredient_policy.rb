module Admin
  module Availability
    class IngredientPolicy < ApplicationPolicy
      def index?
        user.roles.exists?(uuid: 'admin') || user.roles.exists?(uuid: 'store_manager')
      end

      def update?
        user.roles.exists?(uuid: 'admin') || user.roles.exists?(uuid: 'store_manager')
      end
    end
  end
end