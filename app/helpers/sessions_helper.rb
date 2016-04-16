module SessionsHelper
	
	def logged_in?
		!session[:id].nil?
	end

	def current_user
		if logged_in?
			@current_user = User.find(session[:id])
		else
			@current_user = nil
		end
	end	

	def jobsDisplayForLoggedIn
		if logged_in?
			return "view-content col-sm-8"
		else
			return ""
		end
	end


end
