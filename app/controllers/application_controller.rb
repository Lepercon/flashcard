class ApplicationController < ActionController::Base
	def hey
		render html: "Howdy partner"
	end
end
