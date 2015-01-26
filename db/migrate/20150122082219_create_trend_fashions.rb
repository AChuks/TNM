class CreateTrendFashions < ActiveRecord::Migration
  def change
    create_table :trend_fashions do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
