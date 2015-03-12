class Admin < ActiveRecord::Base
	has_secure_password
	before_create :create_remember_token
	def get_admins(type, page, rows, sort_column, sort)
		sort_column="id" if sort_column.nil? && sort_column==""
		case sort
		when "asc"
			admins=Admin.where(admin_type: type).page(page).per(rows).order(sort_column)
		when "desc"
			admins=Admin.where(admin_type: type).page(page).per(rows).order(sort_column).reverse_order
		end
		admins_count=Admin.where(admin_type: type).size
		admins_hash=Hash.new
		admins_hash[:records]=admins_count
		admins_hash[:total]=(admins_count / rows.to_i)+1
		admins_hash[:page]=page
		admins_hash[:rows]=admins
		return admins_hash
	end

	def admin_workload_json(type)
		admins=Array.new
		case type
		when "0"
			#find workload of admin check business
			admins=Admin.find_by_sql("select a.id,a.`name`,count(*) y from admins a join businesses b on a.id=b.sys_admin_id where date_format(b.created_at,'%Y-%m-%d')=curdate() group by a.id")
		when "1"
			#find workload of admin check commodity
			admins=Admin.find_by_sql("select a.id,a.`name`,count(*) y from admins a join tickets b on a.id=b.sys_admin_id where date_format(b.created_at,'%Y-%m-%d')=curdate() group by a.id")
		end
		return admins
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
