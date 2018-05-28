class WelcomeController < ApplicationController

	def home
		redirect_to "/sessions/new" unless session.include? :user_id
	end
	
end
