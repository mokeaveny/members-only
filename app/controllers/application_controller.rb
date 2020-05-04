class ApplicationController < ActionController::Base

	before_action :authorized
	helper_method :current_user
	helper_method :logged_in?
	
	# Keeps track of the current_user when they are on the website
	def current_user
		User.find_by(id: session[:user_id])
	end

	# Keeps track of whether the user is logged in
	def logged_in?
		!current_user.nil?
	end

	def authorized
		redirect_to '/welcome' unless logged_in?
	end

	
end
