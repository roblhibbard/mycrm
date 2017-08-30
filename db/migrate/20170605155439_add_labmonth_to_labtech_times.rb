class AddLabmonthToLabtechTimes < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_times, :labmonth, :integer
  end
end
