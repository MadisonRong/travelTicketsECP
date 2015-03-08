module SessionsHelper
	def sign_in(admin)
		remember_token = Admin.new_remember_token
		cookies	.permanent[:remember_token] = remember_token
		admin.update_attribute(:remember_token, Admin.hash(remember_token))
		self.current_admin=admin
	end

	def signed_in?
		!current_admin.nil?
	end

	def signed_in_admin
		unless signed_in?
			store_location
			redirect_to admins_login_url, notice: "please sign in." 
		end
	end

	def current_admin=(admin)
		@current_admin=admin
	end

	def current_admin
		remember_token = Admin.hash(cookies[:remember_token])
		@current_admin ||= Admin.find_by(remember_token: remember_token)
	end

	def sign_out
		current_admin.update_attribute(:remember_token, Admin.hash(Admin.new_remember_token))
		self.current_admin=nil
		session.delete(:remember_token)
	end

	def store_location
		session[:return_to] = request.fullpath if request.get?
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
end
