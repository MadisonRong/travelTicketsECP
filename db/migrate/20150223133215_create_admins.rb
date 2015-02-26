class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
    	t.string :account
    	t.string :name
    	t.string :password_digests
      t.timestamps null: false
    end
  end
end
