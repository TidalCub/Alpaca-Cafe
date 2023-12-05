class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.references :category, foreign_key: true
      t.timestamps
    end

    create_table :orders do |t|
      #t.references :user, foreign_key: true
      t.references :status, foreign_key: true
      t.timestamps
    end

    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end
