class AddPicturesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :picture_one, :string
    add_column :products, :picture_two, :string
    add_column :products, :picture_three, :string
    add_column :products, :picture_four, :string
  end
end
