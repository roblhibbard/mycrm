class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :address
      t.string :state
      t.integer :zip_code
      t.string :email

      t.timestamps
    end
  end
end
