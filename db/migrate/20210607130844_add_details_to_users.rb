class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :farmname, :string
    add_column :users, :details, :string
    add_column :users, :address, :string
    add_column :users, :origin, :string
    add_column :users, :category, :string
    add_column :users, :website, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
