class RenameYoutubeUrlInVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :youtube_url, :vimeo_video_id
  end
end
