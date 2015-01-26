class CreateTalentVideos < ActiveRecord::Migration
  def change
    create_table :talent_videos do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
