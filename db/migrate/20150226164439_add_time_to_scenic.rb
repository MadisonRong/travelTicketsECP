class AddTimeToScenic < ActiveRecord::Migration
  def change
    add_column :scenics, :start_time, :datetime
    add_column :scenics, :end_time, :datetime
  end
end
