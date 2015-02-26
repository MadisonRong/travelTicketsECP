class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :account, null: false
    	t.string :name, null: false
    	t.string :password_digest, null: false
    	t.string :phone, null: false
    	t.integer :user_identity, default: 0
      t.timestamps null: false
    end
  end
end
