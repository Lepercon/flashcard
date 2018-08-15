class ApplicationController < ActionController::Base
	def home
		render html: "Your website is grand"
	end
end
