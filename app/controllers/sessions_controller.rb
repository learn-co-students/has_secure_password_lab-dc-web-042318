class SessionsController < ApplicationController

	def new
		if !session.include?(:user_id)
			@user = User.new
		else
			redirect_to home_path
		end
	end

	def create
		@user = User.find_by(name: params[:user][:name])
		return head(:forbidden) unless @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect_to home_path
	end

	def destroy
		session.delete :user_id
		redirect_to home_path
	end


end
