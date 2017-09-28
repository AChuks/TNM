class Video < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :author, presence: true, length: {maximum: 50}
	validates :author_email, presence: true, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}
	validates :title, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 250}
	validates :url, presence: true
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end
