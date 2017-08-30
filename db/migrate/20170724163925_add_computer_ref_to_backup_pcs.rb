class AddComputerRefToBackupPcs < ActiveRecord::Migration[5.0]
  def change
    add_reference :backup_pcs, :computer, foreign_key: true
  end
end
