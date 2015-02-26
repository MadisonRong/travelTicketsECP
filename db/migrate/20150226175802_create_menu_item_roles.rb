class CreateMenuItemRoles < ActiveRecord::Migration
  def change
    create_table :menu_item_roles do |t|
    	t.integer :menu_item_id, null: false
    	t.integer :role_id, null: false
      t.timestamps null: false
    end
  end
end
