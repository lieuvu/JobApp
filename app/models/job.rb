class Job < ActiveRecord::Base

	before_save(:on => :create) do
		self.date_posted = Time.new.strftime("%Y-%m-%d")
	end
end
