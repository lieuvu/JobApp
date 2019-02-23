module SessionsHelper
	def current_user
		session[:id].present? ? User.find(session[:id]) : nil
	end
end
