class CreateLabtechClients < ActiveRecord::Migration[5.0]
  def change
    create_table :labtech_clients do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
