class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
    	t.integer :pid
    	t.string :name, null: false
    	t.string :link, limit: 255
      t.timestamps null: false
    end
  end
end
