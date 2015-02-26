class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :uid, null: false
    	t.float :money, null: false
    	t.integer :ticket_id, null: false
    	t.integer :status, default: 0
    	t.string :user_number, null:false
      t.timestamps null: false
    end
  end
end
