class ChangeItemOnBackup < ActiveRecord::Migration[5.0]
  def change
    change_column :backups, :singup_date, :integer
  end
end
