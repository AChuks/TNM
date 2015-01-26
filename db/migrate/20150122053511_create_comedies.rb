class CreateComedies < ActiveRecord::Migration
  def change
    create_table :comedies do |t|
      t.string :url
      t.string :mdata
      t.string :img

      t.timestamps
    end
  end
end
