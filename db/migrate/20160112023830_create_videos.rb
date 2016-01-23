class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.datetime :date
      t.string :meta_data

      t.timestamps
    end
  end
end
