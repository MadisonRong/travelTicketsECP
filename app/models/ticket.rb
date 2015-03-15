class Ticket < ActiveRecord::Base

  belongs_to :business
  has_many :orders

	def get_json_status_list(admin_id, page, rows, sort_column, sort)
		sort_column = "id" if sort_column.nil? || sort_column == ""
		current_page = page
		page = (page.to_i-1) * rows.to_i
		commodity = Ticket.find_by_sql(["select a.id,a.`name`,a.price,b.name scenic,a.description,a.ticket_type,a.created_at from tickets a join scenics b on a.scenic_id=b.id where a.status=0 and sys_admin_id=? order by a.#{sort_column} #{sort} limit #{page},#{rows}", admin_id])
		commodity_count = Ticket.find_by_sql(["select * from tickets a join scenics b on a.scenic_id=b.id where a.status=0 and sys_admin_id=?", admin_id])
		commodity_hash = Hash.new
		commodity_hash[:records] = commodity_count.size
		commodity_hash[:total] = (commodity_count.size / rows.to_i) + 1
		commodity_hash[:page] = current_page
		commodity_hash[:rows] = commodity
		return commodity_hash
	end

	def get_pass(id)
		ticket = Ticket.find(id)
		ticket.update_attribute(:status, 1)
	end

	def get_list(admin_id, page, rows, sort_column, sort)
		business = Business.where(:admin_id, admin_id)
    if sort_column.nil? || sort_column == ""
		  sort_column = "tickets.id" 
    else
      sort_column = "tickets."+sort_column
    end
		current_page = page
		page = (page.to_i - 1) * rows.to_i
    case sort
    when "asc"
      tickets = Ticket.includes(:business).where({"businesses" => {:id=>admin_id}}).page(page).per(rows).order(sort_column)
    when "desc"
      tickets = Ticket.includes(:business).where({"businesses" => {:id=>admin_id}}).page(page).per(rows).reverse_order(sort_column)
    end
    tickets_count = Ticket.includes(:business).where({"businesses" => {:id=>admin_id}}).size
    tickets_hash = Hash.new
    tickets_hash[:records] = tickets_count
    tickets_hash[:total] = (tickets_count.to_i / rows.to_i) + 1
    tickets_hash[:page] = current_page
    tickets_hash[:rows] = tickets
    return tickets_hash
 	end
end


