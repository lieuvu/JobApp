class Job < ActiveRecord::Base
	belongs_to :user

	before_save(:on => :create) do
		self.date_posted = Time.new.strftime("%Y-%m-%d")
	end

	def self.sort(sort_order)
		case sort_order
			when "title" then Job.order(:job_title)
			when "date_posted" then Job.order(date_posted: :desc)
			when "company_name" then Job.joins(:user).order('users.username', :id)
		end 
	end

end
