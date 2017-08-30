class ChangeDateToLabDateInLabtechTime < ActiveRecord::Migration[5.0]
  def change
    rename_column :labtech_times, :date, :lab_date
  end
end
