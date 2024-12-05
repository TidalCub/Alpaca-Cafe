class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :uuid, null: false
      t.index :uuid , unique: true
      t.timestamps
    end
  end
end
