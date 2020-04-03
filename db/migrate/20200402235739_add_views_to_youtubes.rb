class AddViewsToYoutubes < ActiveRecord::Migration[5.2]
  def change
    add_column :youtubes, :views, :string
  end
end
