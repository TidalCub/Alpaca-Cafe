class ChangeStateColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :status_id, :state
  end
end
