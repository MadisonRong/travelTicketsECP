class AdminsController < ApplicationController
  require 'bcrypt'
  before_action :signed_in_admin, only:[:index, :list]
  def index
    @menu=Menu.get_menu current_admin.admin_type
    #render json: menu
  end

  def show
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    admin=Admin.find(params[:id])
    @result=false
    #update admin name
    name=params[:admin][:name]
    unless name.nil?
      @admin.update_attribute(:name, name)
      @result=true
    end
    #update admin password
    password_old=params[:admin][:password_old]
    password_new=params[:admin][:password_new]
    password_new_confirmation=params[:admin][:password_new_confirmation]
    unless password_old.nil? && password_new.nil? && password_new_confirmation.nil?
      if password_new==password_new_confirmation && admin.authenticate(password_old)
        #generate new password for admin accroding to given from front-end
        admin.update_attribute(:password_digest, BCrypt::Password.create(password_new))
        @result=true
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def admin_update
    @result=false
    case params[:oper]
    when 'edit'
      @admin=Admin.find(params[:id])
      #update admin name
      name=params[:name]
      unless name.nil?
        admin.update_attribute(:name, name)
        @result=true
      end
    when 'add'
      #create admin
      admin=Admin.new
      admin.account=params[:account]
      admin.name=params[:name]
      #platform_admin (admin_type is 1)
      admin.admin_type=1
      #default password is 123456
      admin.password_digest=BCrypt::Password.create("123456")
      @result=@admin.save
    when 'del'
      #delete admin
      @result=Admin.find(params[:id]).destroy
    end

    respond_to do |format|
      format.js
    end
  end

  def admin_statistics_workload
    respond_to do |format|
      format.js
    end
  end

  def list
    @title="管理平台管理员"
    respond_to do |format|
      format.js
    end
  end

  def jsonlist
    @admins_hash=Admin.new.get_admins(params[:type], params[:page], params[:rows], params[:sidx], params[:sord])
    render json: @admins_hash
  end

  def admin_workload_json
    type=params[:type]
    @admins=Admin.new.admin_workload_json(type)
  end

  def login

  end

  def logout

  end

  private
  def admin_params
    params.require(:admin).permit(:oper, :id, :name, :account)
  end
end
