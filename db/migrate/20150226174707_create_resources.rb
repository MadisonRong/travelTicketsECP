class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
    	t.string :name, null: false
      t.timestamps null: false
    end
  end
end
