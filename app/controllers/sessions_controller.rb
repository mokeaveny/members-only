class SessionsController < ApplicationController

	skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

	# Finds a user instance based on teh username of that user
  def create
		@user = User.find_by(username: params[:username])

		if @user && @user.authenticate(params[:password])

			session[:user_id] = @user.id

			redirect_to '/authorized'

		else
			flash.now[:danger] = 'Invalid email/password'
			redirect_to '/login'
		end
  end

	def destroy
		session[:user_id] = nil
		redirect_to '/posts', notice: "Logged out!"
	end
		

	def page_requires_login
	end

end
