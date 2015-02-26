class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.string :name, null: false
    	t.float :price, null: false
    	t.integer :scenic_id, null: false
    	t.string :picture
    	t.text :description
    	t.integer :ticket_type, null: false
    	t.integer :status, default: 0
    	t.integer :sys_admin_id
      t.timestamps null: false
    end
  end
end
