class BusinessesController < ApplicationController
	def status_list
		@title="审核商家"
		respond_to do |format|
			format.js 
		end
	end

	def json_status_list
		@page = params[:page]
		@rows=params[:rows]
		@sort_column=params[:sidx]
		@sort=params[:sord]
		@businesses_hash=Business.new.get_json_status_list(current_admin.id, @page, @rows, @sort_column, @sort)
		render json: @businesses_hash
	end

	def pass
		@result=false
		case params[:oper]
		when "del"
			@result=Business.new.get_pass params[:id]
		end
		respond_to do |format|
			format.js { render 'shared/op_result' }
		end
	end

	def list
		@title="管理商家"
		respond_to do |format|
			format.js 
		end
	end

	def json_list
		page=params[:page]
		rows=params[:rows]
		sort_column=params[:sidx]
		sort=params[:sord]
		@businesses_hash=Business.new.get_json_list(current_admin.id, page, rows, sort_column, sort)
		render json: @businesses_hash
	end

	def admin_update
		@result=false
		case params[:oper]
		when 'edit'
			business=Business.find(params[:id])
			#update business
			name=params[:name]
			legal_person_name=params[:legal_person_name]
			legal_person_photo=params[:legal_person_photo]
			unless name.nil? 
				business.update_attribute(:name, name)
				business.update_attribute(:legal_person_name, legal_person_name)
				@result=true
			end
		when 'del'
			#delete business
			@result=Business.find(params[:id]).destroy
		end
		
		respond_to do |format|
			format.js  { render 'shared/op_result' }
		end
	end
end
