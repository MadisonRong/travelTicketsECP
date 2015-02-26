class CreateMenuResources < ActiveRecord::Migration
  def change
    create_table :menu_resources do |t|
    	t.integer :menu_id, null: false
    	t.integer :resource_id, null: false
      t.timestamps null: false
    end
  end
end
