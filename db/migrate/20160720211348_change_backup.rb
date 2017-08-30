class ChangeBackup < ActiveRecord::Migration[5.0]
  def change
    rename_column :backups, :singup_date, :signup_date
    change_column :backups, :signup_date, :integer
  end
end
