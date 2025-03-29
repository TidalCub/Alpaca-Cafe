class ChangeMenuToProductStock < ActiveRecord::Migration[8.0]
  def change
    rename_table :menus, :product_stocks
  end
end
