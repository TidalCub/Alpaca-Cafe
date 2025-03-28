# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.roles.exists?(uuid: 'admin')
  end

  def show?
    user == record
  end

  def edit?
    user.roles.exists?(uuid: 'admin')
  end

  def update_role?
    user.roles.exists?(uuid: 'admin')
  end
end
