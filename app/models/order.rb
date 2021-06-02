class Order < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :order_products
  has_many :products, through: :order_products
end
