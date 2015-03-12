class RenameUidToOrder < ActiveRecord::Migration
  def change
    rename_column :orders, :uid, :user_id
  end
end
