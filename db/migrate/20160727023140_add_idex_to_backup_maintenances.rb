class AddIdexToBackupMaintenances < ActiveRecord::Migration[5.0]
  def change
    add_reference :backup_maintenances, :backup, index: true
  end
end
