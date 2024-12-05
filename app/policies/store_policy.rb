# frozen_string_literal: true

class StorePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def select_store?
    true
  end
end
