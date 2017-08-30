class AddTotalsToLabtechTime < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_times, :total_hours, :decimal, precision: 12, scale: 2
    add_column :labtech_times, :total_min, :decimal, precision: 12, scale: 2
  end
end
