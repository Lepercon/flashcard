module SessionsHelper
	#Logs in given user
	def log_in(user)
		session[:user_id] = user.id
	end
	#Returns current logged-in user (if any)
	def current_user
		@current_user ||= User.find_by(id: sessions[:user_id])
	end
end
