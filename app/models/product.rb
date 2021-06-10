class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :reviews, through: :orders
  # has_many_attached :photos

  belongs_to :user

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [:name, :location],
    against: [:name, :product_category],
    associated_against: {
      user: [:address]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
