# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def index?
    user.roles.pluck(:uuid).include?('store:manager') || user.roles.pluck(:uuid).include?('admin')
  end

  def show?
    user.roles.pluck(:uuid).include?('store:manager') || record.user == user || user.roles.pluck(:uuid).include?('admin')
  end

  def cart?
    user == record.user
  end

  def checkout?
    user == record.user
  end

  def update?
    user == record.user
  end

  def complete_order?
    user == record.user
  end
end
