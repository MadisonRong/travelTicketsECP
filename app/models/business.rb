class Business < ActiveRecord::Base

	def get_json_status_list(admin_id, page, rows, sort_column, sort)
		sort_column= "id" if sort_column.nil? || sort_column==""
		current_page=page
		page=(page.to_i-1)*rows.to_i
		@businesses=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=0 and sys_admin_id=? order by #{sort_column} #{sort} limit #{page},#{rows}", admin_id])
		@businesses_count=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=0 and sys_admin_id=?", admin_id])
		@businesses_hash=Hash.new
		@businesses_hash[:records]=@businesses_count.size
		@businesses_hash[:total]=(@businesses_count.size / rows.to_i)+1
		@businesses_hash[:page]=current_page
		@businesses_hash[:rows]=@businesses
		return @businesses_hash
	end

	def get_pass(id)
		business=Business.find(id)
		business.update_attribute(:business_status, 1)
	end

	def get_json_list(admin_id, page, rows, sort_column, sort)
		sort_column= "id" if sort_column.nil? || sort_column==""
		current_page=page
		page=(page.to_i-1)*rows.to_i
		@businesses=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=1 and sys_admin_id=? order by #{sort_column} #{sort} limit #{page},#{rows}", admin_id])
		@businesses_count=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=1 and sys_admin_id=?", admin_id])
		@businesses_hash=Hash.new
		@businesses_hash[:records]=@businesses_count.size
		@businesses_hash[:total]=(@businesses_count.size / rows.to_i)+1
		@businesses_hash[:page]=current_page
		@businesses_hash[:rows]=@businesses
		return @businesses_hash
	end
end
