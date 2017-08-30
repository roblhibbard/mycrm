class CreateLabtechLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :labtech_locations do |t|
      t.string :lclient_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax
      t.text :comments
      t.belongs_to :labtech_client

      t.timestamps
    end
  end
end
