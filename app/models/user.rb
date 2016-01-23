class User < ActiveRecord::Base
	include TheComments::User
	include TheComments::Commentable

	  has_many :youtubes
	  has_many :videos
	  has_many :relateds


	before_save {self.email = email.downcase}
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	#  bcrypt function for hashing user password
	has_secure_password
	validates :password, length: {minimum: 6}

	def admin?
		self == User.first
	end

	def comments_admin?
		admin?
	end

	def comments_moderator? comment
		id == comment.holder_id
	end
end
