class ChangeMenuToProductStock < ActiveRecord::Migration[8.0]
  def change
    rename_index :menus, 'menus_pkey', 'product_stock_pkey' 
    rename_table :menus, :product_stocks
  end
end
