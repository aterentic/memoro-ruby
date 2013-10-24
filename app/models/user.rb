class User < ActiveRecord::Base

	before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	has_secure_password

	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 254 }, format: { with: VALID_EMAIL_REGEX }
	validates :password, length: { minimum: 6 }

end
