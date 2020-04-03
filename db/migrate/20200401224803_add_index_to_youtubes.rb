class AddIndexToYoutubes < ActiveRecord::Migration[5.2]
  def change
    add_index :youtubes, :url, unique: true
  end
end
