class Business < ActiveRecord::Base

  has_many :tickets
  has_many :order

	def get_json_status_list(admin_id, page, rows, sort_column, sort)
		sort_column= "id" if sort_column.nil? || sort_column==""
		current_page=page
		page=(page.to_i-1)*rows.to_i
		businesses=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=0 and sys_admin_id=? order by #{sort_column} #{sort} limit #{page},#{rows}", admin_id])
		businesses_count=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=0 and sys_admin_id=?", admin_id])
		businesses_hash=Hash.new
		businesses_hash[:records]=businesses_count.size
		businesses_hash[:total]=(businesses_count.size / rows.to_i)+1
		businesses_hash[:page]=current_page
		businesses_hash[:rows]=businesses
		return businesses_hash
	end

	def get_pass(id)
		business=Business.find(id)
		business.update_attribute(:business_status, 1)
	end

	def get_json_list(admin_id, page, rows, sort_column, sort)
		sort_column= "id" if sort_column.nil? || sort_column==""
		current_page=page
		page=(page.to_i-1)*rows.to_i
		businesses=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=1 and sys_admin_id=? order by #{sort_column} #{sort} limit #{page},#{rows}", admin_id])
		businesses_count=Business.find_by_sql(["select id, name, operating_license, legal_person_name, legal_person_photo, created_at from businesses where business_status=1 and sys_admin_id=?", admin_id])
		businesses_hash=Hash.new
		businesses_hash[:records]=businesses_count.size
		businesses_hash[:total]=(businesses_count.size / rows.to_i)+1
		businesses_hash[:page]=current_page
		businesses_hash[:rows]=businesses
		return businesses_hash
	end

	def count_business
=begin
select date_format(created_at,'%d') day,count(*) mount from businesses 
  where date_format(created_at, '%Y-%m')=date_format(curdate(),'%Y-%m') group by day
=end
    time = Time.new
    year_month = time.strftime("%Y-%m")
    businesses = Business.select("date_format(created_at,'%d') day,count(*) mount").where(["date_format(created_at, '%Y-%m')=?", year_month]).group("day").order("day")
    #查询结果集的迭代指针
    iterator = 0;
    #暂时先这样，应该要再写个小算法去计算闰年和每个月的天数
    month_hash = { "01" => 31, "02" => 28, "03" => 31, "04" => 30, "05" => 31, "06" => 30, "07" => 31, "08" => 31, "09" => 30, "10" => 31, "11" => 30, "12" => 31 }
    month = time.strftime("%m")
    business_array = Array.new
    1.upto(month_hash[month]) do |d|
      if iterator < businesses.length && businesses[iterator].day.to_i == d
        business_array.push(businesses[iterator].mount)
        iterator += 1
      else
        business_array.push(0)
      end
    end
    return business_array
	end
end
