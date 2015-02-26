class AddAdminTypeToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :admin_type, :string
  end
end
