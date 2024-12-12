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

Role.destroy_all
Role.create!(name: 'customer', uuid: 'customer')

# User.destroy_all
# User.create!(email: 'customer@alpaca.com', password: 'password', password_confirmation: 'password')

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

Category.create!([{
                   name: 'Slow Roasted Coffee'
                 },
                  {
                    name: 'Iced Coffee'
                  },
                  {
                    name: 'Teas'
                  }])

Product.create!([
                  # Existing products...

                  # Additional products with the 'image' column
                  {
                    name: 'Latte',
                    description: 'A latte is a coffee drink made with espresso and steamed milk.',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Slow Roasted Coffee').id,
                    image: 'latte_image.png'
                  },
                  {
                    name: 'Cappuccino',
                    description: 'A cappuccino is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam.',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Slow Roasted Coffee').id,
                    image: 'cappuccino_image.png'
                  },
                  {
                    name: 'Iced Latte',
                    description: 'A latte is a coffee drink made with espresso and steamed milk.',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Iced Coffee').id,
                    image: 'iced_latte_image.png'
                  },
                  {
                    name: 'Iced Cappuccino',
                    description: 'A cappuccino is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam.',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Iced Coffee').id,
                    image: 'iced_cappuccino_image.png'
                  },
                  {
                    name: 'Iced Tea',
                    description: '',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Teas').id,
                    image: 'iced_tea_image.png'
                  },
                  {
                    name: 'Breakfast Tea',
                    description: '',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Teas').id,
                    image: 'breakfast_tea_image.png'
                  },
                  {
                    name: 'Green Tea',
                    description: '',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Teas').id,
                    image: 'green_tea_image.png'
                  },
                  {
                    name: 'Chai Tea',
                    description: '',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Teas').id,
                    image: 'chai_tea_image.png'
                  },
                  {
                    name: 'Espresso Shot',
                    description: 'A concentrated shot of espresso.',
                    price: 1.99,
                    category_id: Category.find_by(name: 'Slow Roasted Coffee').id,
                    image: 'espresso_shot_image.png'
                  },
                  {
                    name: 'Americano',
                    description: 'A diluted espresso with added water.',
                    price: 3.99,
                    category_id: Category.find_by(name: 'Slow Roasted Coffee').id,
                    image: 'americano_image.png'
                  },
                  {
                    name: 'Mocha',
                    description: 'An espresso-based drink with milk and chocolate syrup.',
                    price: 5.99,
                    category_id: Category.find_by(name: 'Slow Roasted Coffee').id,
                    image: 'mocha_image.png'
                  },
                  {
                    name: 'Macchiato',
                    description: 'An espresso shot with a dollop of foam.',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Slow Roasted Coffee').id,
                    image: 'macchiato_image.png'
                  },
                  {
                    name: 'Flat White',
                    description: 'A coffee drink with double espresso and steamed milk.',
                    price: 4.99,
                    category_id: Category.find_by(name: 'Slow Roasted Coffee').id,
                    image: 'flat_white_image.png'
                  }
                ])

IngredientGroup.create!([{
                          name: 'Milk'
                        }, {
                          name: 'Shots'
                        }, {
                          name: 'Toppings'
                        }, {
                          name: 'Syurp'
                        }, {
                          name: 'Blend'
                        }])

Ingredient.create!([{
                     name: 'Whole Milk',
                     ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id,
                     is_default: true
                   },
                    {
                      name: 'Oat Milk',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                    },
                    {
                      name: 'Almond Milk',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                    },
                    {
                      name: 'Single Espresso',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id,
                      is_default: true
                    },
                    {
                      name: 'Double Espresso',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                    },
                    {
                      name: 'Cream',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Toppings').id
                    }, {
                      name: 'None',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Toppings').id,
                      is_default: true
                    }, {
                      name: 'Carmal',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Syurp').id
                    }, {
                      name: 'None',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Syurp').id,
                      is_default: true
                    }, {
                      name: 'Regular',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Blend').id,
                      is_default: true
                    }, {
                      name: 'Decaf',
                      ingredient_group_id: IngredientGroup.find_by(name: 'Blend').id
                    }])

Recipe.create!([{
                 product_id: Product.find_by(name: 'Latte').id,
                 ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
               },
                {
                  product_id: Product.find_by(name: 'Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Toppings').id
                },
                {
                  product_id: Product.find_by(name: 'Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Syurp').id
                },
                {
                  product_id: Product.find_by(name: 'Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Blend').id
                },
                {
                  product_id: Product.find_by(name: 'Cappuccino').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                },
                {
                  product_id: Product.find_by(name: 'Cappuccino').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Cappuccino').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Toppings').id
                },
                {
                  product_id: Product.find_by(name: 'Cappuccino').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Syurp').id
                },
                {
                  product_id: Product.find_by(name: 'Cappuccino').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Blend').id
                },
                {
                  product_id: Product.find_by(name: 'Iced Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                },
                {
                  product_id: Product.find_by(name: 'Iced Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Iced Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Toppings').id
                },
                {
                  product_id: Product.find_by(name: 'Iced Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Syurp').id
                },
                {
                  product_id: Product.find_by(name: 'Iced Latte').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Blend').id
                },

                {
                  product_id: Product.find_by(name: 'Iced Tea').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                },
                {
                  product_id: Product.find_by(name: 'Breakfast Tea').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                },
                {
                  product_id: Product.find_by(name: 'Green Tea').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                },
                {
                  product_id: Product.find_by(name: 'Chai Tea').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                }, {
                  product_id: Product.find_by(name: 'Espresso Shot').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Americano').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Mocha').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Mocha').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                },
                {
                  product_id: Product.find_by(name: 'Mocha').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Syurp').id
                },
                {
                  product_id: Product.find_by(name: 'Macchiato').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Macchiato').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Toppings').id
                },
                {
                  product_id: Product.find_by(name: 'Flat White').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Shots').id
                },
                {
                  product_id: Product.find_by(name: 'Flat White').id,
                  ingredient_group_id: IngredientGroup.find_by(name: 'Milk').id
                }])

Menu.destroy_all
Product.find_each do |product|
  Store.find_each do |store|
    Menu.create!(store_id: store.id, product_id: product.id, available: true)
  end
end

IngredientStock.destroy_all
Ingredient.find_each do |ingredient|
  Store.find_each do |store|
    IngredientStock.create!(store_id: store.id, ingredient_id: ingredient.id, available: true)
  end
end
