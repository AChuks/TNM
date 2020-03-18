class AddAcceptedToTrendings < ActiveRecord::Migration[5.2]
  def change
    add_column :trendings, :accepted, :boolean
  end
end
