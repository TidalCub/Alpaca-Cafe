class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user, :integer, null: false, default: 0
  end
end
