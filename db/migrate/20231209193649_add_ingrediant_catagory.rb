# frozen_string_literal: true

class AddIngrediantCatagory < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
