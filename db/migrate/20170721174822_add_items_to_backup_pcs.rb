class AddItemsToBackupPcs < ActiveRecord::Migration[5.0]
  def change
    add_column :backup_pcs, :external_hd, :string
    add_column :backup_pcs, :serial, :string
  end
end
