class CreateWebseries < ActiveRecord::Migration
  def change
    create_table :webseries do |t|
      t.string :url
      t.string :metadata
      t.string :thumbimg

      t.timestamps
    end
  end
end
