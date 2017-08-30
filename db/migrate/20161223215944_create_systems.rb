class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :make
      t.string :model
      t.string :serial_number
      t.string :user_login
      t.string :user_password
      t.string :other_items
      t.string :system_type
      t.references :client, foreign_key: true
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
