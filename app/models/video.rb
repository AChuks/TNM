class Video < ActiveRecord::Base

  # scopes
  scope :has_vimeo_video_id, -> () {where.not(vimeo_video_id: '') }
  scope :same_vimeo_video_id_as, -> (vimeo_video_id) {where vimeo_video_id: vimeo_video_id}
  scope :same_author_email, -> (author_email) {where author_email: author_email}


  # Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :author, presence: true, length: {maximum: 50}
	validates :author_email, presence: true, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}
	validates :title, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 250}
	validates :url, presence: true
end
