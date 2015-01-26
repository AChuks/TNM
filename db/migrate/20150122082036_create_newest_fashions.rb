class CreateNewestFashions < ActiveRecord::Migration
  def change
    create_table :newest_fashions do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
