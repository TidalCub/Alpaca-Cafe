# frozen_string_literal: true

class CreateStore < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.timestamps
      t.references :adress
    end

    create_table :adress do |t|
      t.integer :number
      t.string :street
      t.string :city
      t.string :postcode
      t.string :county
      t.string :country
      t.timestamps
      t.references :store
    end
  end
end
