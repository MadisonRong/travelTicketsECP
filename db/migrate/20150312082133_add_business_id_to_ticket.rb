class AddBusinessIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :business_id, :integer
  end
end
