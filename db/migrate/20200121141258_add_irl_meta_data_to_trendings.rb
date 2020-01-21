class AddIrlMetaDataToTrendings < ActiveRecord::Migration[5.2]
  def change
    add_column :trendings, :is_irl, :boolean, :default => false
    add_column :trendings, :is_youtube, :boolean, :default => false
    add_column :trendings, :vimeo_video_id, :string
    add_column :trendings, :thumb_nail, :string
  end
end
