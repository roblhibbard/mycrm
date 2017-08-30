class ChangeLabtechClientTo < ActiveRecord::Migration[5.0]
  def change
    rename_column :labtech_clients, :client, :lclient_id
  end
end
