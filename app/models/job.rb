class Job < ActiveRecord::Base
	belongs_to :user

	before_save(:on => :create) do
		self.date_posted = Time.new.strftime("%Y-%m-%d")
	end

	def self.sort(sort_order)
		case sort_order
			when "title" then
				Job.where('date_valid >= ?', Time.zone.now.beginning_of_day)
					 .order(:job_title)
			when "date_posted" then
				Job.where('date_valid >= ?', Time.zone.now.beginning_of_day)
					 .order(date_posted: :desc)
			when "company_name" then
				Job.where('date_valid >= ?', Time.zone.now.beginning_of_day)
					 .joins(:user)
					 .order('users.username', :id)
		end 
	end

end
