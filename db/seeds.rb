# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ProductModifyer.destroy_all
OrderItem.destroy_all
Order.destroy_all
Recipe.destroy_all
Product.destroy_all
Category.destroy_all
Ingredient.destroy_all
IngredientGroup.destroy_all
User.destroy_all
User.create!(email: "customer@alpaca.com", password: "password", password_confirmation: "password")


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
  },{
  name: "Iced Cappuccino",
  description: "A cappuccino is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam.",
  price: 4.99,
  category_id: Category.find_by(name: "Iced Coffee").id
},{
  name: "Iced Tea",
  description: "",
  price: 4.99,
  category_id: Category.find_by(name: "Teas").id
},{
  name: "Breakfast Tea",
  description: "",
  price: 4.99,
  category_id: Category.find_by(name: "Teas").id
},{
  name: "Green Tea",
  description: "",
  price: 4.99,
  category_id: Category.find_by(name: "Teas").id
},{
  name: "Chai Tea",
  description: "",
  price: 4.99,
  category_id: Category.find_by(name: "Teas").id
},{
  name: "Espresso Shot",
  description: "A concentrated shot of espresso.",
  price: 1.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Americano",
  description: "A diluted espresso with added water.",
  price: 3.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Mocha",
  description: "An espresso-based drink with milk and chocolate syrup.",
  price: 5.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Macchiato",
  description: "An espresso shot with a dollop of foam.",
  price: 4.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Flat White",
  description: "A coffee drink with double espresso and steamed milk.",
  price: 4.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Affogato",
  description: "Vanilla ice cream topped with a shot of espresso.",
  price: 6.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Hot Chocolate",
  description: "A warm chocolate drink made with milk and syrup.",
  price: 4.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Frappuccino",
  description: "A blended coffee drink with milk, coffee blend, and ice.",
  price: 5.99,
  category_id: Category.find_by(name: "Slow Roasted Coffee").id
},
{
  name: "Matcha Latte",
  description: "A latte made with matcha powder, milk, and sweetener.",
  price: 5.99,
  category_id: Category.find_by(name: "Teas").id
},
{
  name: "Iced Chai Latte",
  description: "An iced latte made with chai tea and milk.",
  price: 4.99,
  category_id: Category.find_by(name: "Iced Coffee").id
},
])

IngredientGroup.create!([{
    name: "Milk",
  },{
    name: "Shots",
  },{
    name: "Toppings",
  },{ 
    name: "Syurp" 
  },{
    name: "Blend"
  }])


Ingredient.create!([{
    name: "Whole Milk",
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
    is_default: true
  },
  {
    name: "Oat Milk",
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    name: "Almond Milk",
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    name: "Single Espresso",
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
    is_default: true
  },
  {
    name: "Double Espresso",
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    name: "Cream",
    ingredient_group_id: IngredientGroup.find_by(name: "Toppings").id,
  },{
    name: "None",
    ingredient_group_id: IngredientGroup.find_by(name: "Toppings").id,
    is_default: true
  },{
    name: "Carmal",
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },{
    name: "None",
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
    is_default: true
  },{
    name: "Regular",
    ingredient_group_id: IngredientGroup.find_by(name: "Blend").id,
    is_default: true
  },{
    name: "Decaf",
    ingredient_group_id: IngredientGroup.find_by(name: "Blend").id,
  }])

  Recipe.create!([{
    product_id: Product.find_by(name: "Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Toppings").id,
  },
  {
    product_id: Product.find_by(name: "Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },
  {
    product_id: Product.find_by(name: "Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Blend").id,
  },
  {
    product_id: Product.find_by(name: "Cappuccino").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Cappuccino").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Cappuccino").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Toppings").id,
  },
  {
    product_id: Product.find_by(name: "Cappuccino").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },
  {
    product_id: Product.find_by(name: "Cappuccino").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Blend").id,
  },
  {
    product_id: Product.find_by(name: "Iced Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Iced Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Iced Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Toppings").id,
  },
  {
    product_id: Product.find_by(name: "Iced Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },
  {
    product_id: Product.find_by(name: "Iced Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Blend").id,
  },

  {
    product_id: Product.find_by(name: "Iced Tea").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Breakfast Tea").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Green Tea").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Chai Tea").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },{
    product_id: Product.find_by(name: "Espresso Shot").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Americano").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Mocha").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Mocha").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Mocha").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },
  {
    product_id: Product.find_by(name: "Macchiato").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Macchiato").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Toppings").id,
  },
  {
    product_id: Product.find_by(name: "Flat White").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Flat White").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Affogato").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Shots").id,
  },
  {
    product_id: Product.find_by(name: "Affogato").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },
  {
    product_id: Product.find_by(name: "Hot Chocolate").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Hot Chocolate").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },
  {
    product_id: Product.find_by(name: "Frappuccino").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Frappuccino").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Blend").id,
  },
  {
    product_id: Product.find_by(name: "Matcha Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Blend").id,
  },
  {
    product_id: Product.find_by(name: "Matcha Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
  {
    product_id: Product.find_by(name: "Matcha Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Syurp").id,
  },
  {
    product_id: Product.find_by(name: "Iced Chai Latte").id,
    ingredient_group_id: IngredientGroup.find_by(name: "Milk").id,
  },
])
