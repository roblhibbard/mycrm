class AddClientRefToBackupPcs < ActiveRecord::Migration[5.0]
  def change
    add_reference :backup_pcs, :client, foreign_key: true
  end
end
