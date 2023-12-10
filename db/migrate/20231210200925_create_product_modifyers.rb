class CreateProductModifyers < ActiveRecord::Migration[7.0]
  def change
    create_table :product_modifyers do |t|
      t.references :order_item, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
