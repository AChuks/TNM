class Video < ActiveRecord::Base
  include PgSearch::Model

  # Association
  has_many :video_views, :foreign_key => 'video_url', :primary_key => 'url'
  # has_many :video_views, :foreign_key => 'video_id', :primary_key => 'id'

  # scopes
  scope :has_vimeo_video_id, -> () {where.not(vimeo_video_id: '') }
  scope :is_irl, -> () {where.not(is_irl: false) }
  scope :not_irl, -> () {where(is_irl: false) }
  scope :same_vimeo_video_id_as, -> (vimeo_video_id) {where vimeo_video_id: vimeo_video_id}
  scope :same_url_as, -> (url) {where url: url}
  scope :same_author_email, -> (author_email) {where author_email: author_email}


  # Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :author, presence: true, length: {maximum: 50}
	validates :author_email, presence: true, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}
	validates :title, presence: true, length: {maximum: 300}
	validates :description, presence: true, length: {maximum: 300}
	validates :url, presence: true
	validates :agreed_to_vid_sub_policy, presence: true

  pg_search_scope :search, against: [:title]
end
