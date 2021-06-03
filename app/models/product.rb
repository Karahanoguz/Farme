class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
