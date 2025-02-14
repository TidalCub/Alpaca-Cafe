# frozen_string_literal: true

coffee_products = [
  { name: 'Latte', description: 'A latte is a coffee drink made with espresso and steamed milk.', image: 'latte_image.png' },
  { name: 'Cappuccino', description: 'A cappuccino is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam.', image: 'cappuccino_image.png' },
  { name: 'Espresso Shot', description: 'A concentrated shot of espresso.', image: 'espresso_shot_image.png' },
  { name: 'Americano', description: 'A diluted espresso with added water.', image: 'americano_image.png' },
  { name: 'Mocha', description: 'An espresso-based drink with milk and chocolate syrup.', image: 'mocha_image.png' },
  { name: 'Macchiato', description: 'An espresso shot with a dollop of foam.', image: 'macchiato_image.png' },
  { name: 'Flat White', description: 'A coffee drink with double espresso and steamed milk.', image: 'flat_white_image.png' }
]

iced_coffee_products = [
  { name: 'Iced Latte', description: 'A latte is a coffee drink made with espresso and steamed milk.', image: 'iced_latte_image.png' },
  { name: 'Iced Cappuccino', description: 'A cappuccino is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam.', image: 'iced_cappuccino_image.png' },
  { name: 'Iced Mocha', description: 'A chocolate-flavored iced coffee made with espresso, milk, and chocolate syrup.' },
  { name: 'Iced Americano', description: 'Espresso shots topped with cold water for a refreshing iced coffee.' },
  { name: 'Iced Caramel Macchiato', description: 'Espresso combined with vanilla-flavored syrup, milk, and caramel drizzle.' },
  { name: 'Iced Vanilla Latte', description: 'A smooth blend of espresso, milk, and vanilla syrup served over ice.' },
  { name: 'Iced Hazelnut Latte', description: 'Espresso mixed with milk and hazelnut syrup over ice.' },
  { name: 'Iced Chai Latte', description: 'A refreshing blend of spiced chai tea and milk served over ice.' },
  { name: 'Iced Matcha Latte', description: 'A creamy and refreshing blend of matcha green tea and milk over ice.' },
  { name: 'Iced Flat White', description: 'Smooth espresso with velvety microfoam milk served over ice.' },
  { name: 'Cold Brew Coffee', description: 'Smooth, naturally sweet coffee steeped slowly in cold water.' }
]

teas_products = [
  { name: 'Iced Tea', description: '', image: 'iced_tea_image.png' },
  { name: 'Breakfast Tea', description: '', image: 'breakfast_tea_image.png' },
  { name: 'Green Tea', description: '', image: 'green_tea_image.png' },
  { name: 'Chai Tea', description: '', image: 'chai_tea_image.png' },
  { name: 'Earl Grey Tea', description: 'Classic black tea with bergamot.' },
  { name: 'Peppermint Tea', description: 'Cool and minty.' },
  { name: 'Chamomile Tea', description: 'Relaxing and floral.' },
  { name: 'Jasmine Tea', description: 'Delicate floral flavor.' }

]

pastries_products = [
  { name: 'Croissant', description: 'Flaky and buttery.', image: 'Missing_Plate_Item.png' },
  { name: 'Chocolate Croissant', description: 'Sweet and chocolaty.', image: 'Missing_Plate_Item.png' },
  { name: 'Almond Croissant', description: 'Nutty and delicious.', image: 'Missing_Plate_Item.png' },
  { name: 'Cinnamon Roll', description: 'Sweet and spiced.', image: 'Missing_Plate_Item.png' },
  { name: 'Blueberry Muffin', description: 'Bursting with blueberries.', image: 'Missing_Plate_Item.png' },
  { name: 'Banana Bread', description: 'Moist and flavorful.', image: 'Missing_Plate_Item.png' },
  { name: 'Scone', description: 'Perfect with tea.', image: 'Missing_Plate_Item.png' },
  { name: 'Cheese Danish', description: 'Creamy and flaky.', image: 'Missing_Plate_Item.png' },
  { name: 'Apple Turnover', description: 'Sweet and fruity.', image: 'Missing_Plate_Item.png' },
  { name: 'Cherry Danish', description: 'Tart and sweet.', image: 'Missing_Plate_Item.png' },
  { name: 'Eclair', description: 'Rich and creamy.', image: 'Missing_Plate_Item.png' },
  { name: 'Lemon Tart', description: 'Zesty and sweet.', image: 'Missing_Plate_Item.png' },
  { name: 'Chocolate Tart', description: 'Indulgently chocolaty.', image: 'Missing_Plate_Item.png' },
  { name: 'Pecan Pie', description: 'Nutty and sweet.', image: 'Missing_Plate_Item.png' },
  { name: 'Macaron', description: 'Light and airy.', image: 'Missing_Plate_Item.png' }
]

hot_chocolate_products = [
  { name: 'Classic Hot Chocolate', description: 'Rich and creamy cocoa.' },
  { name: 'White Hot Chocolate', description: 'Smooth white cocoa.' },
  { name: 'Premium Hot Chocolate', description: 'Rich and creamy with premium cocoa with whipped cream.' }
]

cold_drinks_products = [
  { name: 'Sparkling Water', description: '' },
  { name: 'Lemonade', description: '' },
  { name: 'Iced Coconut Water', description: '' },
  { name: 'Milk Carton', description: '' },
  { name: 'Cola', description: '' },
  { name: 'Cola Max', description: '' },
  { name: 'Diet Cola', description: '' },
  { name: 'Cherry Cola', description: '' },
  { name: 'Chocolate Milk Carton', description: '' },
  { name: 'Still Water 400ml', description: '' },
  { name: 'Still Water 335ml', description: '' },
  { name: 'Still Water 1L', description: '' },
  { name: 'Dr. Cola', description: '' },
  { name: 'Cola Lite', description: '' },
  { name: 'Iced Banana Water', description: '' },
  { name: 'Strawberry Milk Carton', description: '' },
  { name: 'Orange Juice', description: '' }
]

milkshake_products = [
  { name: 'Chocolate Milkshake', description: '' },
  { name: 'Vanilla Milkshake', description: '' },
  { name: 'Banana Milkshake', description: '' },
  { name: 'Strawberry Milkshake', description: '' },
  { name: 'Caramel Milkshake', description: '' }
]

seasonal_products = [
  { name: 'Pumpkin Spice Latte', description: 'Fall favorite.' },
  { name: 'Eggnog Latte', description: 'Holiday classic.' },
  { name: 'Gingerbread Latte', description: 'Warm and spiced.' },
  { name: 'Peppermint Mocha', description: 'Cool and chocolaty.' },
  { name: 'Hot Apple Cider', description: 'Warm and fruity.' },
  { name: 'Maple Latte', description: 'Sweet and indulgent.' },
  { name: 'Winter Blend Coffee', description: 'Rich and comforting.' },
  { name: 'Chestnut Praline Latte', description: 'Nutty and sweet.' },
  { name: 'Toasted Marshmallow Hot Chocolate', description: 'Sweet and nostalgic.' },
  { name: 'Cranberry Punch', description: 'Tart and festive.' },
  { name: 'Pumpkin Chai Latte', description: 'Spiced and seasonal.' },
  { name: 'Holiday Blend Coffee', description: 'Warm and bold.' },
  { name: 'Cinnamon Roll Latte', description: 'Sweet and spiced.' },
  { name: 'Apple Pie Latte', description: 'Tastes like dessert.' },
  { name: 'Peppermint Hot Chocolate', description: 'Cool and rich.' }
]

cakes_products = [
  { name: 'Classic Chocolate Cake', description: 'Rich and moist chocolate cake.' },
  { name: 'Vanilla Bean Cake', description: 'Classic vanilla flavor with a soft texture.' },
  { name: 'Red Velvet Cake', description: 'Smooth and vibrant red cake with cream cheese frosting.' },
  { name: 'Carrot Cake', description: 'Spiced cake with shredded carrots and cream cheese frosting.' },
  { name: 'Lemon Drizzle Cake', description: 'Zesty lemon cake with a sweet glaze.' },
  { name: 'Black Forest Cake', description: 'Chocolate layers with cherries and whipped cream.' },
  { name: 'Tiramisu Cake', description: 'Coffee-flavored Italian dessert in cake form.' },
  { name: 'Strawberry Shortcake', description: 'Light and fluffy cake with fresh strawberries and cream.' },
  { name: 'Funfetti Cake', description: 'Vanilla cake with colorful sprinkles baked in.' },
  { name: 'Banana Cake', description: 'Soft and moist banana cake with a caramel frosting.' },
  { name: 'Coconut Cake', description: 'Tropical coconut flavor with fluffy frosting.' },
  { name: 'Cheesecake', description: 'Rich and creamy classic cheesecake.' },
  { name: 'Pineapple Upside-Down Cake', description: 'Caramelized pineapple topping with soft cake.' },
  { name: 'Matcha Green Tea Cake', description: 'Earthy and unique matcha flavor in a soft cake.' },
  { name: 'Raspberry Almond Cake', description: 'Light almond cake with a fresh raspberry layer.' },
  { name: 'Opera Cake', description: 'Elegant coffee and chocolate layered cake.' },
  { name: 'Pumpkin Spice Cake', description: 'Warm spiced cake perfect for fall.' },
  { name: 'Mocha Cake', description: 'Chocolate and coffee flavors combined in a decadent cake.' },
  { name: 'Peanut Butter Chocolate Cake', description: 'Rich chocolate cake with creamy peanut butter frosting.' },
  { name: 'Angel Food Cake', description: 'Light and airy cake perfect for any occasion.' }
]

coffee_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Drink.png'
  Category.find_by(name: 'Slow Roasted Coffee').products.find_or_create_by!(product_attrs)
end

pastries_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Plate_Item.png'
  Category.find_by(name: 'Pastries').products.find_or_create_by!(product_attrs)
end

teas_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Drink.png'
  Category.find_by(name: 'Teas').products.find_or_create_by!(product_attrs)
end

iced_coffee_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Drink.png'
  Category.find_by(name: 'Iced Coffee').products.find_or_create_by!(product_attrs)
end

hot_chocolate_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Drink.png'
  Category.find_by(name: 'Hot Chocolate').products.find_or_create_by!(product_attrs)
end

cold_drinks_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Drink.png'
  Category.find_by(name: 'Cold Drinks').products.find_or_create_by!(product_attrs)
end

milkshake_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Drink.png'
  Category.find_by(name: 'Milkshakes').products.find_or_create_by!(product_attrs)
end

seasonal_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Drink.png'
  Category.find_by(name: 'Seasonal').products.find_or_create_by!(product_attrs)
end

cakes_products.each do |product_attrs|
  product_attrs[:price] ||= rand(4.00...6.00).round(2)
  product_attrs[:image] ||= 'Missing_Plate_Item.png'
  Category.find_by(name: 'Cakes').products.find_or_create_by!(product_attrs)
end
