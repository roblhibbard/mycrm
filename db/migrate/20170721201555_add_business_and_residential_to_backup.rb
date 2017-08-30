class AddBusinessAndResidentialToBackup < ActiveRecord::Migration[5.0]
  def change
    add_column :backups, :business, :boolean
    add_column :backups, :residential, :boolean
    add_column :backups, :active, :boolean
  end
end
