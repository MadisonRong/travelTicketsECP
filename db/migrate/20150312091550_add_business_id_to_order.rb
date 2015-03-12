class AddBusinessIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :business_id, :integer
  end
end
