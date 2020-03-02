class RenameYoutubeUrlInVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :youtube_url, :vimeo_video_id
  end
end
