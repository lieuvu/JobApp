class User < ActiveRecord::Base
	include SecureRandom
	has_many :jobs, dependent: :destroy


	before_save(:on => :create) do
		begin
			temp = SecureRandom.uuid()
		end while User.where(access_code: temp).present?
		self.access_code = temp
	end
	
end
