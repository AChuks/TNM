class AddIndexToVideoUrl < ActiveRecord::Migration[5.2]
  def change
    add_index :videos, :url, unique: true
  end
end
