class FixAddressTableName < ActiveRecord::Migration[8.0]
  def change
    rename_table :adress, :addresses
  end
end