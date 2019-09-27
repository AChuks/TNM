class AddThumbNailToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :thumb_nail, :string
    add_column :videos, :frame, :string
  end
end
