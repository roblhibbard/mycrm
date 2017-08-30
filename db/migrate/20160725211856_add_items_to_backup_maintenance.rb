class AddItemsToBackupMaintenance < ActiveRecord::Migration[5.0]
  def change
   add_index :backup_maintenances, :backup
  end
end
