class DelBAckupMaintenaces < ActiveRecord::Migration[5.0]
  def change
    drop_table :backup_maintenances
  end
end
