class CreateAdresses < ActiveRecord::Migration[8.0]
  def change
    create_table :adresses do |t|
      t.timestamps
    end
  end
end
