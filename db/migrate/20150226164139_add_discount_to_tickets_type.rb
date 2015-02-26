class AddDiscountToTicketsType < ActiveRecord::Migration
  def change
  	add_column :tickets_types, :discount, :float
  end
end
