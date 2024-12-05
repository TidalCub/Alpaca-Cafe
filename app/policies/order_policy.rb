# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def index?
    user.roles.pluck(:uuid).include?('store:manager')
  end

  def show?
    user.roles.pluck(:uuid).include?('store:manager') || record.user == user
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
