class AddIsTwitterToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :is_twitter, :boolean, :default => false
  end
end