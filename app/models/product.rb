class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
