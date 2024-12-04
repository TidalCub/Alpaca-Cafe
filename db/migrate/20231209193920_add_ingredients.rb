# frozen_string_literal: true

class AddIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.references :ingredient_group, foreign_key: true
      t.boolean :is_default, default: false
      t.timestamps
    end
  end
end
