class CreateBackupPcs < ActiveRecord::Migration[5.0]
  def change
    create_table :backup_pcs do |t|
      t.text :notes
      t.boolean :active
      t.belongs_to :labtech_computer
      t.belongs_to :labtech_client
      t.belongs_to :service_list
      t.belongs_to :contract_service
     

      t.timestamps
    end
  end
end
