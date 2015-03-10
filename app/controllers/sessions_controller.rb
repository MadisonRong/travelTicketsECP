class SessionsController < ApplicationController
	before_action :signed_in_admin, only:[:destroy]
	def create
		admin = Admin.find_by(account: params[:session][:account])
		if admin && admin.authenticate(params[:session][:password])
			sign_in admin
			redirect_back_or admins_path
		else
			flash.now[:danger] = "Invalidated accout /password."
			render 'admins/login'
		end
	end

	def destroy
		sign_out
		redirect_to admins_login_path
	end

end
