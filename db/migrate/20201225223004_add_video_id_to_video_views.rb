class AddVideoIdToVideoViews < ActiveRecord::Migration[5.2]
  def change
    add_column :video_views, :video_id, :integer
    add_foreign_key :video_views, :videos, column: :video_id, primary_key: "id", on_delete: :cascade
  end
end
