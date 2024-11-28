class CreateIngredientStocks < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredient_stocks do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
