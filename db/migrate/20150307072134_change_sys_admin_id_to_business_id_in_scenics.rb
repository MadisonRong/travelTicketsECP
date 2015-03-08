class ChangeSysAdminIdToBusinessIdInScenics < ActiveRecord::Migration
  def change
  	rename_column :scenics, :sys_admin_id, :business_id
  end
end
