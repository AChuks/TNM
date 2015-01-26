class CreateNewestVideos < ActiveRecord::Migration
  def change
    create_table :newest_videos do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
