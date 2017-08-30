class AddLclientIdToLabtechTime < ActiveRecord::Migration[5.0]
  def change
    add_column :labtech_times, :lclient_id, :integer
  end
end
