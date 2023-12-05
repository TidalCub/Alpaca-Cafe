class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user_id, :integer, null: false, default: 0
    add_reference :orders, :users, index: true
    add_foreign_key :orders, :users
  end
end
