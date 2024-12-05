class ProductPolicy < ApplicationPolicy
  def index?
    user.roles.pluck(:uuid).include?('staff')
  end

  def show?
    true
  end

  def create?
    user.roles.pluck(:uuid).include?('product:editor')
  end

  def add_to_basket?
    true
  end
end
