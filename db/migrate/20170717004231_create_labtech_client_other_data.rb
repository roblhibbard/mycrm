class CreateLabtechClientOtherData < ActiveRecord::Migration[5.0]
  def change
    create_table :labtech_client_other_data do |t|
      t.integer :lclient_id
      t.string :name
      t.string :contract_rep
      t.string :monthly_billable_time
      t.string :monthly_emergency_time
      t.string :monthly_non_billable_time
      t.integer :servers_under_contract
      t.integer :workstations_under_contract
      t.belongs_to :labtech_client, foreign_key: true

      t.timestamps
    end
  end
end
