class AddAccountIndexToAdmin < ActiveRecord::Migration
  def change
    add_index :admins, :account, unique: true
  end
end
