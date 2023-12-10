class AddRecpie < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :product, foreign_key: true
      t.references :ingredient_group, foreign_key: true
      t.timestamps
    end
  end
end
