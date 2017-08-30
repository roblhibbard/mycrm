class ChangColNameLabtechClient < ActiveRecord::Migration[5.0]
  def change
    rename_column :labtech_clients, :client_id, :client
  end
end
