# frozen_string_literal: true

class RolePolicy < ApplicationPolicy
  def index?
    user.roles.exists?(uuid: 'admin')
  end

  def show?
    user.roles.exists?(uuid: 'admin')
  end

  def create?
    user.roles.exists?(uuid: 'admin')
  end

  def update?
    user.roles.exists?(uuid: 'admin')
  end

  def edit?
    user.roles.exists?(uuid: 'admin')
  end

  def new?
    user.roles.exists?(uuid: 'admin')
  end

  def destroy?
    user.roles.exists?(uuid: 'admin')
  end
end
