class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.string :name, null: false
    	t.string :operating_license, null: false
    	t.string :legal_person_name, null: false
    	t.string :legal_person_photo, null: false
    	t.integer :business_status, default: 0
    	t.integer :sys_admin_id
      t.timestamps null: false
    end
  end
end
