class AddItemsToBackup < ActiveRecord::Migration[5.0]
  def change
    add_column :backups, :backup_account, :integer
    add_column :backups, :backup_size, :string
    add_column :backups, :size_used, :integer
    add_column :backups, :used_percent, :decimal, precision: 12, scale: 2, default: 0.0, null: false
    add_column :backups, :alerts, :string
    add_column :backups, :devices, :integer
    
  end
end
