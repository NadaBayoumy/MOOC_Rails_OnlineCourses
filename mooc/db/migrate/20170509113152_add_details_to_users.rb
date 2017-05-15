class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birthdate, :string
    add_column :users, :gender, :string
    add_column :users, :picture, :string
  end
end
