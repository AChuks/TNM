class AddIrlToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :is_irl, :boolean, :default => false
  end
end
