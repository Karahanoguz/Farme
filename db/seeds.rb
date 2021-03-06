# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

Review.destroy_all
OrderProduct.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

user = User.new(email: 'lalala@gmail.com', password: '2222222')
user.save!

producer_url = 'https://spreadsheets.google.com/feeds/list/1P-1XskeGrYVfUAP527EAzhpC3QT6BQ3Weh7VVz3mCkg/od6/public/values?alt=json'
producer_seed_url = open(producer_url).read
producer_seed_json = JSON.parse(producer_seed_url)

producers = producer_seed_json["feed"]["entry"]
producers.each do |producer|
  producer_instance = User.new(
    email: producer["gsx$email"]["$t"],
    password: "3333333",
    address: producer["gsx$address"]["$t"],
    farmname: producer["gsx$name"]["$t"],
    origin: producer["gsx$origin"]["$t"],
    category: producer["gsx$category"]["$t"],
    website: producer["gsx$websitecontact"]["$t"],
    details: producer["gsx$details"]["$t"],
    picture: producer["gsx$profilepicture"]["$t"],
    producer: true)
  producer_instance.save!
  puts "producer saved :)"
end


product_url = 'https://spreadsheets.google.com/feeds/list/1P-1XskeGrYVfUAP527EAzhpC3QT6BQ3Weh7VVz3mCkg/2/public/values?alt=json'

product_seed_url = open(product_url).read
product_seed_json = JSON.parse(product_seed_url)

products = product_seed_json["feed"]["entry"]
products.each do |product|
  product_instance = Product.new(
    name: product["gsx$nameproduct"]["$t"],
    detail: product["gsx$details"]["$t"],
    price: product["gsx$price"]["$t"].to_i,
    product_category: product["gsx$category"]["$t"],
    user_id: User.find_by(farmname:product["gsx$producersname"]["$t"]).id,
    picture: product["gsx$picture"]["$t"],
    picture_one: product["gsx$pictureone"]["$t"],
    picture_two: product["gsx$picturetwo"]["$t"],
    picture_three: product["gsx$picturethree"]["$t"],
    picture_four: product["gsx$picturefour"]["$t"])

  file = URI.open(product["gsx$picture"]["$t"])
  product_instance.photo.attach(io: file, filename: "product_#{ product_instance.name }.png", content_type: 'image/png')

  product_instance.save!
  puts "product saved :)"
end

order = Order.new(user_id: user.id, status: "delivered")
order.save!
orderproduct = OrderProduct.create(product_id: Product.first.id, quantity: 1, order_id: order.id)
