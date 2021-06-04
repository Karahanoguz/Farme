# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

OrderProduct.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

user = User.new(email: 'lalala@gmail.com', password: '2222222')
user.save!

count = 0

product = Product.new(name: "Pecorino", product_category: "cheese", detail: "Pecorino cheeses are hard Italian cheeses made from sheep's milk. The name pecorino derives from pecora which means sheep in Italian.", location: "Italy", price: 15, user_id: user.id)

product.save!
10.times do
puts "Creating a new product"
  links = ['https://res.cloudinary.com/vale-sapi/image/upload/v1622802936/FarMe/F1_m18gid.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802923/FarMe/F5_rwgwtr.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802921/FarMe/F9_hvx1fy.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802921/FarMe/F10_a1dhxp.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802921/FarMe/F7_r5mmga.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802920/FarMe/F8_oybck9.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802920/FarMe/F6_p0d5th.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802920/FarMe/F2_yp95je.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622802920/FarMe/F4_uxxxwg.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622803229/FarMe/F11.jpeg_pvsl57.jpg']
  file = URI.open(links[count])
  product = Product.new(
    name: Faker::Food.dish,
    product_category: Faker::Food.ingredient,
    detail: Faker::Food.description,
    location: Faker::Address.country,
    price: rand(10..100),
    user_id: user.id
    )
  product.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  product.save!
  count += 1
end
