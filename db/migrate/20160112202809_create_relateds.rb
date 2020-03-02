class CreateRelateds < ActiveRecord::Migration[5.2]
  def change
    create_table :relateds do |t|
      t.string :url
      t.string :title
      t.datetime :date
      t.string :meta_data

      t.timestamps
    end
  end
end
