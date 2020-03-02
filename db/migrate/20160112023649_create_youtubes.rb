class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.string :url
      t.string :title
      t.datetime :date
      t.string :meta_data

      t.timestamps
    end
  end
end
