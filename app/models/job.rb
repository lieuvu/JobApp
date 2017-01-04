class Job < ActiveRecord::Base
	belongs_to :user

	before_save(:on => :create) do
		self.date_posted = Time.new.strftime("%Y-%m-%d")
	end

	def self.sort(sort_order)
		case sort_order
			when "title" then find_by_sql("SELECT * FROM jobs ORDER BY jobs.job_title COLLATE NOCASE ASC")
			when "date_posted" then  order(date_posted: :desc)
			when "company_name" then joins("INNER JOIN users ON jobs.user_id = users.id ORDER BY users.username COLLATE NOCASE ASC, jobs.id ASC")
		end 
	end

end
