module UsersHelper

	def user_existed?
		if !flash[:error].nil?
			return "User already existed"
		else
			return "User created successfuly"
		end
	end
	
end
