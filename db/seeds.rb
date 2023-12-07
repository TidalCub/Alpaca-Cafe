# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

OrderItem.destroy_all
Order.destroy_all

User.destroy_all
User.create!(email: "customer@alpaca.com", password: "password", password_confirmation: "password")

Category.destroy_all
Category.create!([{
    name: "Slow Roasted Coffee"
  },
  {
    name: "Iced Coffee"
  },
  {
    name: "Teas"
  }
])

Product.destroy_all
Product.create!([{
    name: "Latte",
    description: "A latte is a coffee drink made with espresso and steamed milk.",
    price: 4.99,
    category_id: Category.find_by(name: "Slow Roasted Coffee").id
  },
  {
    name: "Cappuccino",
    description: "A cappuccino is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam.",
    price: 4.99,
    category_id: Category.find_by(name: "Slow Roasted Coffee").id
  },
  {
    name: "Iced Latte",
    description: "A latte is a coffee drink made with espresso and steamed milk.",
    price: 4.99,
    category_id: Category.find_by(name: "Iced Coffee").id
  }
])