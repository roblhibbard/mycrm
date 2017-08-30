class AddRefToBackupPcs < ActiveRecord::Migration[5.0]
  def change
    add_reference :backup_pcs, :backup, foreign_key: true
  end
end
