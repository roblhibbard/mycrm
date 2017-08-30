class ChangeBackupAccountToString < ActiveRecord::Migration[5.0]
  def change
    change_column :backups, :backup_account, :string
  end
end
