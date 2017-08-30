class ChangeColumnLabtechClients < ActiveRecord::Migration[5.0]
  def change
    rename_column :labtickets, :client_id, :lab_clientid
  end
end
