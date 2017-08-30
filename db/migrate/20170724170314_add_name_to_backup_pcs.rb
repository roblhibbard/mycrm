class AddNameToBackupPcs < ActiveRecord::Migration[5.0]
  def change
    add_column :backup_pcs, :name, :string
  end
end
