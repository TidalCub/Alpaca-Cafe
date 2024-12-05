# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 20_241_205_113_128) do
  create_table 'addresses', force: :cascade do |t|
    t.integer 'number'
    t.string 'street'
    t.string 'city'
    t.string 'postcode'
    t.string 'county'
    t.string 'country'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'store_id'
    t.index ['store_id'], name: 'index_addresses_on_store_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ingredient_groups', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ingredient_stocks', force: :cascade do |t|
    t.integer 'ingredient_id', null: false
    t.integer 'store_id', null: false
    t.boolean 'available', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredient_id'], name: 'index_ingredient_stocks_on_ingredient_id'
    t.index ['store_id'], name: 'index_ingredient_stocks_on_store_id'
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'name'
    t.integer 'ingredient_group_id'
    t.boolean 'is_default', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredient_group_id'], name: 'index_ingredients_on_ingredient_group_id'
  end

  create_table 'menus', force: :cascade do |t|
    t.integer 'store_id', null: false
    t.integer 'product_id', null: false
    t.boolean 'available', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_menus_on_product_id'
    t.index ['store_id'], name: 'index_menus_on_store_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.integer 'order_id'
    t.integer 'product_id'
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_order_items_on_order_id'
    t.index ['product_id'], name: 'index_order_items_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'state'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', default: 0, null: false
    t.integer 'users_id'
    t.integer 'store_id'
    t.index ['store_id'], name: 'index_orders_on_store_id'
    t.index ['users_id'], name: 'index_orders_on_users_id'
  end

  create_table 'product_modifyers', force: :cascade do |t|
    t.integer 'order_item_id', null: false
    t.integer 'ingredient_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredient_id'], name: 'index_product_modifyers_on_ingredient_id'
    t.index ['order_item_id'], name: 'index_product_modifyers_on_order_item_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.decimal 'price', precision: 8, scale: 2
    t.integer 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image'
    t.string 'slug'
    t.index ['category_id'], name: 'index_products_on_category_id'
    t.index ['slug'], name: 'index_products_on_slug', unique: true
  end

  create_table 'recipes', force: :cascade do |t|
    t.integer 'product_id'
    t.integer 'ingredient_group_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredient_group_id'], name: 'index_recipes_on_ingredient_group_id'
    t.index ['product_id'], name: 'index_recipes_on_product_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'UUID', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['UUID'], name: 'index_roles_on_UUID', unique: true
  end

  create_table 'stocks', force: :cascade do |t|
    t.integer 'store_id', null: false
    t.integer 'ingredient_id', null: false
    t.boolean 'in_stock', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredient_id'], name: 'index_stocks_on_ingredient_id'
    t.index ['store_id'], name: 'index_stocks_on_store_id'
  end

  create_table 'stores', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'adress_id'
    t.string 'slug'
    t.index ['adress_id'], name: 'index_stores_on_adress_id'
  end

  create_table 'user_roles', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'role_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['role_id'], name: 'index_user_roles_on_role_id'
    t.index ['user_id'], name: 'index_user_roles_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'ingredient_stocks', 'ingredients'
  add_foreign_key 'ingredient_stocks', 'stores'
  add_foreign_key 'ingredients', 'ingredient_groups'
  add_foreign_key 'menus', 'products'
  add_foreign_key 'menus', 'stores'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'order_items', 'products'
  add_foreign_key 'orders', 'stores'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'product_modifyers', 'ingredients'
  add_foreign_key 'product_modifyers', 'order_items'
  add_foreign_key 'products', 'categories'
  add_foreign_key 'recipes', 'ingredient_groups'
  add_foreign_key 'recipes', 'products'
  add_foreign_key 'stocks', 'ingredients'
  add_foreign_key 'stocks', 'stores'
  add_foreign_key 'user_roles', 'roles'
  add_foreign_key 'user_roles', 'users'
end
