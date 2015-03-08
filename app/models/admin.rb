class Admin < ActiveRecord::Base
	has_secure_password
	before_create :create_remember_token
	def admin_workload_json(type)
		@admins=Array.new
		case type
		when "0"
			#find workload of admin check business
			@admins=Admin.find_by_sql("select a.id,a.`name`,count(*) y from admins a join businesses b on a.id=b.sys_admin_id where date_format(b.created_at,'%Y-%m-%d')=curdate() group by a.id")
		when "1"
			#find workload of admin check commodity
			@admins=Admin.find_by_sql("select a.id,a.`name`,count(*) y from admins a join tickets b on a.id=b.sys_admin_id where date_format(b.created_at,'%Y-%m-%d')=curdate() group by a.id")
		end
		return @admins
	end

	def Admin.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Admin.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token=Admin.hash(Admin.new_remember_token)
		end
end
