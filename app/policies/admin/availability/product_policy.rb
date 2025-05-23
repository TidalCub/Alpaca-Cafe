# frozen_string_literal: true

module Admin
  module Availability
    class ProductPolicy < ApplicationPolicy
      def index?
        user.roles.exists?(uuid: 'admin') || user.roles.exists?(uuid: 'store_manager')
      end

      def update?
        user.roles.exists?(uuid: 'admin') || user.roles.exists?(uuid: 'store_manager')
      end
    end
  end
end
