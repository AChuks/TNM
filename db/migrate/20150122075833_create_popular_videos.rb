class CreatePopularVideos < ActiveRecord::Migration
  def change
    create_table :popular_videos do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
