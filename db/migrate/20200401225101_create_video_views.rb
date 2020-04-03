class CreateVideoViews < ActiveRecord::Migration[5.2]
  def change
    create_table :video_views do |t|
      t.string :youtube_url
      t.string :video_url
      t.string :views
    end
    add_foreign_key :video_views, :videos, column: :video_url, primary_key: "url", on_delete: :cascade
    add_foreign_key :video_views, :youtubes, column: :youtube_url, primary_key: "url", on_delete: :cascade
  end
end
