class CreateVideos < ActiveRecord::Migration
  def change
  	drop_table :videos
    create_table :videos do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
