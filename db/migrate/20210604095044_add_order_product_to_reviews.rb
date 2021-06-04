class AddOrderProductToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :order_product, null: false, foreign_key: true
  end
end
