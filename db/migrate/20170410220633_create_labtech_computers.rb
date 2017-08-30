class CreateLabtechComputers < ActiveRecord::Migration[5.0]
  def change
    create_table :labtech_computers do |t|
      t.integer :labcomputer_id
      t.integer :lclient_id
      t.integer :lablocation_id
      t.string :name
      t.string :username
      t.string :os
      t.string :domain
      t.belongs_to :labtech_client
      t.belongs_to :labtech_location

      t.timestamps
    end
  end
end
