class Ticket < ActiveRecord::Base
	def get_json_status_list(admin_id, page, rows, sort_column, sort)
		sort_column= "id" if sort_column.nil? || sort_column==""
		current_page=page
		page=(page.to_i-1)*rows.to_i
		@commodity=Ticket.find_by_sql(["select a.id,a.`name`,a.price,b.name scenic,a.description,a.ticket_type,a.created_at from tickets a join scenics b on a.scenic_id=b.id where a.status=0 and sys_admin_id=? order by a.#{sort_column} #{sort} limit #{page},#{rows}", admin_id])
		@commodity_count=Ticket.find_by_sql(["select * from tickets a join scenics b on a.scenic_id=b.id where a.status=0 and sys_admin_id=?", admin_id])
		@commodity_hash=Hash.new
		@commodity_hash[:records]=@commodity_count.size
		@commodity_hash[:total]=(@commodity_count.size / rows.to_i)+1
		@commodity_hash[:page]=current_page
		@commodity_hash[:rows]=@commodity
		return @commodity_hash
	end
end
