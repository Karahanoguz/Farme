# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Product.destroy_all
User.destroy_all

user = User.new(email: 'lalala@gmail.com', password: '2222222')
user.save!

# count = 0

10.times do
puts "Creating a new product"
# links = ['https://res.cloudinary.com/vale-sapi/image/upload/v1622111484/barca10_tqg2pu.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111485/barca9_plxxsu.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111484/barca8_zwwykc.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111484/barca7_tlkya3.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111466/barca5_urv3bq.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111465/barca6_jmegac.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111465/barca4_xujewk.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111465/barca3_udzo6d.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111230/barca2_xtkudl.jpg', 'https://res.cloudinary.com/vale-sapi/image/upload/v1622111208/barca1_f5vqqj.jpg']
# file = URI.open(links[count])
  product = Product.new(
    name: Faker::Food.dish,
    product_category: Faker::Food.ingredient,
    detail: Faker::Food.description,
    location: Faker::Address.country,
    price: rand(10..100),
    user_id: user.id
    )
  # boat.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  product.save!
  # count += 1
end
