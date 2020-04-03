class AddViewsToTrendings < ActiveRecord::Migration[5.2]
  def change
    add_column :trendings, :views, :string
  end
end
