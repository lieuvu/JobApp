class PagesController < ApplicationController

	def home
		return @jobs = Job.all
	end

	def about
	end

end
