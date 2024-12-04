# frozen_string_literal: true

class CreateMenu < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.references :store, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
