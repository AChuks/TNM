class Video < ActiveRecord::Base
	validates :author, presence: true, length: {maximum: 50}
	validates :title, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 250}
	validates :url, presence: true
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end
