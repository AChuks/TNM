class AddAuthorEmailToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :author_email, :string
  end
end
