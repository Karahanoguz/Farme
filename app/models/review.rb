class Review < ApplicationRecord
  belongs_to :order
  belongs_to :order_product

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
