class CreateBackupMaintenances < ActiveRecord::Migration[5.0]
  def change
    create_table :backup_maintenances do |t|
      t.references :backup, foreign_key: true
      t.datetime :date
      t.datetime :last_backup
      t.integer :client_items_id
      t.integer :client_id
      t.string :notes

      t.timestamps
    end
  end
end
