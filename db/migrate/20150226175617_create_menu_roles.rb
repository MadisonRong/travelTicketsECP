class CreateMenuRoles < ActiveRecord::Migration
  def change
    create_table :menu_roles do |t|
    	t.integer :menu_id, null: false
    	t.integer :role_id, null: false
      t.timestamps null: false
    end
  end
end
