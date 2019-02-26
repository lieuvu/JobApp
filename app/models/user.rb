class User < ActiveRecord::Base
	
	# -------
	# Include
	# -------
	
	include SecureRandom
	
	# ------------
	# Relationship
	# ------------

	has_many :jobs, dependent: :destroy

	# --------------
	# Filter methods
	# --------------

	before_create :assign_access_code
	
	private def assign_access_code
		begin
			temp = SecureRandom.uuid()
		end while User.where(access_code: temp).present?
		self.access_code = temp
	end
	
end
