class CreateScenics < ActiveRecord::Migration
  def change
    create_table :scenics do |t|
    	t.string :name, null:false
    	t.string :picture, null:false
    	t.string :manager_name, null:false
    	t.string :manager_number, null: false
    	t.integer :sys_admin_id
      t.timestamps null: false
    end
  end
end
