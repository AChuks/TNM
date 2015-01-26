class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
