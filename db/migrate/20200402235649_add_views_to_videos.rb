class AddViewsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :views, :string
  end
end
