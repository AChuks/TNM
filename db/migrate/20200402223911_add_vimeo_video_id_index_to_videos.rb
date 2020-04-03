class AddVimeoVideoIdIndexToVideos < ActiveRecord::Migration[5.2]
  def change
    add_index :videos, :vimeo_video_id, unique: true
  end
end
