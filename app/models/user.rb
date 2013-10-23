class User < ActiveRecord::Base
	validates :email, presence: true, length: { maximum: 254 }
end
