class AddIsYoutubeToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :is_youtube, :boolean, :default => false
  end
end
