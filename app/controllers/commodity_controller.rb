class CommodityController < ApplicationController
	before_action :signed_in_admin, only:[:json_status_list]
	def status_list
		@title="审核商品"
		respond_to do |format|
			format.js { render 'list' }
		end
	end

	def json_status_list
		@commodity=Ticket.find_by_sql(["select a.id,a.`name`,a.price,b.name scenic,a.description,a.ticket_type,a.created_at from tickets a join scenics b on a.scenic_id=b.id where a.status=0 and sys_admin_id=?", current_admin.id])
	end

	def update
		render nothing: false
	end
end
