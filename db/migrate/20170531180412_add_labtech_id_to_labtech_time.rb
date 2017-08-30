class AddLabtechIdToLabtechTime < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_times, :labtech_id, :integer
  end
end
