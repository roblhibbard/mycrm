class CreateLabtechTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :labtech_times do |t|
      t.integer :timeslipid
      t.integer :ticketid
      t.integer :hours
      t.integer :mins
      t.boolean :done
      t.datetime :date
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.belongs_to :labticket, foreign_key: true
      t.belongs_to :labtech_client, foreign_key: true

      t.timestamps
    end
  end
end
