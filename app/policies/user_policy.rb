# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    user == record
  end
end
