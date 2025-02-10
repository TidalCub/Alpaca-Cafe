require 'faker'
require 'factory_bot_rails'

# # frozen_string_literal: true

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)

ProductModifyer.destroy_all
OrderItem.destroy_all
Order.destroy_all
Recipe.destroy_all
Product.destroy_all
Category.destroy_all
Ingredient.destroy_all
IngredientGroup.destroy_all
Role.destroy_all
Role.create!(name: 'customer', uuid: 'customer')

User.destroy_all
User.create!(email: 'customer@alpaca.com', password: 'password', password_confirmation: 'password', stripe_id: 'cus_RNzSxzNYWd2eZ4')
FactoryBot.create_list(:user, 40)

UserRole.destroy_all
UserRole.create(user_id: User.first.id, role_id: Role.first.id)

Store.destroy_all
Store.create!(name: 'Colchester', slug: 'colchester')
Store.create!(name: 'Ipswich', slug: 'ipswitch')

Address.destroy_all
Address.create!(store_id: Store.first.id, number: '224', street: 'High St.', city: 'Colchester', postcode: 'CO1 1TH',
                county: 'Essex', country: 'United Kingdom')
Address.create!(store_id: Store.second.id, number: '112', street: 'Main St.', city: 'Ipswich', postcode: 'IP1 1TH',
                county: 'Suffolk', country: 'United Kingdom')

Category.find_or_create_by!([{
                              name: 'Slow Roasted Coffee'
                            }, {
                              name: 'Iced Coffee'
                            }, {
                              name: 'Teas'
                            }, {
                              name: 'Pastries'
                            }, {
                              name: 'Hot Chocolate'
                            }, {
                              name: 'Cold Drinks'
                            }, {
                              name: 'Seasonal'
                            }, {
                              name: 'Milkshakes'
                            }, {
                              name: 'Cakes'
                            }])
load(Rails.root.join('db/seeds/products.rb'))

IngredientGroup.find_or_create_by!([{
                                     name: 'Milk'
                                   }, {
                                     name: 'Shots'
                                   }, {
                                     name: 'Toppings'
                                   }, {
                                     name: 'Syrup'
                                   }, {
                                     name: 'Blend'
                                   }])

Recipe.destroy_all
Category.find_by(name: 'Slow Roasted Coffee').products.each do |product|
  IngredientGroup.find_each do |ingredient_group|
    Recipe.find_or_create_by!(product_id: product.id, ingredient_group_id: ingredient_group.id)
  end
end

Category.find_by(name: 'Iced Coffee').products.each do |product|
  IngredientGroup.find_each do |ingredient_group|
    Recipe.find_or_create_by!(product_id: product.id, ingredient_group_id: ingredient_group.id)
  end
end

Category.find_by(name: 'Hot Chocolate').products.each do |product|
  IngredientGroup.where.not(name: 'Blend').find_each do |ingredient_group|
    Recipe.find_or_create_by!(product_id: product.id, ingredient_group_id: ingredient_group.id)
  end
end

Category.find_by(name: 'Teas').products.each do |product|
  Recipe.find_or_create_by!(product_id: product.id, ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id)
  Recipe.find_or_create_by!(product_id: product.id, ingredient_group_id: IngredientGroup.find_by(name: 'Blend').id)
end

Category.find_by(name: 'Milkshakes').products.each do |product|
  Recipe.find_or_create_by!(product_id: product.id, ingredient_group_id: IngredientGroup.find_by(name: 'Syrup').id)
end

Menu.destroy_all
Product.find_each do |product|
  Store.find_each do |store|
    Menu.find_or_create_by!(store_id: store.id, product_id: product.id, available: true)
  end
end

milk_options = [
  { name: 'Semi-Skimmed', is_default: true },
  { name: 'Skimmed', is_default: false },
  { name: 'Whole', is_default: false },
  { name: 'Oat', is_default: false },
  { name: 'Almond', is_default: false },
  { name: 'Soy', is_default: false },
  { name: 'Coconut', is_default: false }
]

blend_options = [
  { name: 'Decaf', is_default: false },
  { name: 'Regular', is_default: true }
]

shots_options = [
  { name: 'Single', is_default: true },
  { name: 'Double', is_default: false },
  { name: 'Triple', is_default: false }
]

toppings_options = [
  { name: 'Whipped Cream', is_default: false },
  { name: 'Chocolate Sprinkles', is_default: false },
  { name: 'Caramel Drizzle', is_default: false },
  { name: 'Marshmallows', is_default: false }
]

syrup_options = [
  { name: 'Caremel', is_default: false },
  { name: 'Vanilla', is_default: false },
  { name: 'Hazelnut', is_default: false },
  { name: 'Raspberry', is_default: false },
  { name: 'Gingerbread', is_default: false },
  { name: 'Cinnamon', is_default: false }
]

milk_options.each do |options|
  IngredientGroup.find_or_create_by!(name: 'Milk').ingredients.create!(options)
end

blend_options.each do |options|
  IngredientGroup.find_or_create_by!(name: 'Blend').ingredients.create!(options)
end

shots_options.each do |options|
  IngredientGroup.find_or_create_by!(name: 'Shots').ingredients.create!(options)
end

toppings_options.each do |options|
  IngredientGroup.find_or_create_by!(name: 'Toppings').ingredients.create!(options)
end

syrup_options.each do |options|
  IngredientGroup.find_or_create_by!(name: 'Syrup').ingredients.create!(options)
end

IngredientStock.destroy_all
Ingredient.find_each do |ingredient|
  Store.find_each do |store|
    IngredientStock.find_or_create_by!(store_id: store.id, ingredient_id: ingredient.id, available: true)
  end
end
