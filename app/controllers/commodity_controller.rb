class CommodityController < ApplicationController
	before_action :signed_in_admin, only:[:json_status_list]
	def status_list
		@title="审核商品"
		respond_to do |format|
			format.js { render 'list' }
		end
	end

	def json_status_list
		@page=params[:page]
		@rows=params[:rows]
		@sort_column=params[:sidx]
		@sort=params[:sord]
		@commodity_hash=Ticket.new.get_json_status_list(current_admin.id, @page, @rows, @sort_column, @sort)
		render json: @commodity_hash
	end

	def update
		render nothing: false
	end
end
