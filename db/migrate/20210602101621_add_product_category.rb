class AddProductCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_category, :string
  end
end
