class CreateStockTable < ActiveRecord::Migration[8.0]
  def change
    create_table :stocks do |t|
      t.references :store, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.boolean :in_stock, default: false
      t.timestamps
    end
  end
end
