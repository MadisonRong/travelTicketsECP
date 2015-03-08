class AddAdminIdToBussiness < ActiveRecord::Migration
  def change
    add_column :businesses, :admin_id, :integer
  end
end
