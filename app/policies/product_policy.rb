# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def index?
    user.roles.pluck(:uuid).include?('staff') || user.roles.pluck(:uuid).include?('admin')
  end

  def show?
    true
  end

  def create?
    user.roles.pluck(:uuid).include?('product:editor') || user.roles.pluck(:uuid).include?('admin')
  end

  def add_to_basket?
    true
  end

  def export?
    user.roles.pluck(:uuid).include?('product:editor') || user.roles.pluck(:uuid).include?('admin')
  end
end
