# frozen_string_literal: true

class AddStoreToOrder < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :store, null: true, foreign_key: true
  end
end
