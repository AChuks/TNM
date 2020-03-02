class AddStatusColumnsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :deleted, :boolean, :default => false
    add_column :videos, :processed, :boolean, :default => false
    add_column :videos, :accepted, :boolean, :default => false
  end
end
