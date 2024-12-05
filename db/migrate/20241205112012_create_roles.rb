class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :UUID, null: false
      t.index :UUID, unique: true
      t.timestamps
    end
  end
end
