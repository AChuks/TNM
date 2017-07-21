class AddPasswordToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :password_hash, :string
  	add_column :users, :password_salt, :string
  	rename_column :users, :name, :user_name
  end
end
