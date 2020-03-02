class AddAuthorEmailToVideos < ActiveRecord::Migration[5.2]
  def change
  	add_column :videos, :author_email, :string
  end
end
