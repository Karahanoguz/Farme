class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :reviews, through: :orders

  belongs_to :user

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
