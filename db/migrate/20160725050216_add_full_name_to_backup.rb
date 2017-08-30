class AddFullNameToBackup < ActiveRecord::Migration[5.0]
  def change
    add_column :backups, :client_first_name, :string, index: true
    add_column :backups, :client_last_name, :string, index: true
    add_column :backups, :client_full_name, :string, index: true
  end
end
