class Youtube < ActiveRecord::Base
  include TheComments::Commentable
    belongs_to :user


	scope :same_meta_data_as, -> (meta_data) {where meta_data: meta_data}
	scope :same_url_as, -> (url) {where url: url}

  # Denormalization methods
  # Migration: t.string :title
  # => "My new awesome post"
  def commentable_title
    try(:title) || "Undefined video title"
  end

  # => your way to build URL
  # => "/posts/254"
  def commentable_url
    ['', self.class.to_s.tableize, id].join('/')
  end

  # gem 'state_machine'
  # Migration: t.string :state
  # => "published" | "draft" | "deleted"
  def commentable_state
    try(:state) || "published"
  end
end
