class RemovePasswordHashSaltFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :password_hash
  	remove_column :users, :password_salt
  end
end
