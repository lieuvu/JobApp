module JobsHelper
	def direct_to_edit(job)
		user = User.find(job[:company_id])
		return "#"
	end
end
