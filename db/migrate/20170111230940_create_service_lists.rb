class CreateServiceLists < ActiveRecord::Migration[5.0]
  def change
    create_table :service_lists do |t|
      t.decimal :charge
      t.integer :workstation
      t.integer :server
      t.integer :antivirus
      t.integer :backup
      t.integer :hours
      t.integer :email
      t.integer :office
      t.integer :reoccurrence
      t.boolean :monthly
      t.boolean :yearly
      t.boolean :two_year
      t.boolean :one_time

      t.timestamps
    end
  end
end
