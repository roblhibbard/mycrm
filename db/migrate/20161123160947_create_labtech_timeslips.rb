class CreateLabtechTimeslips < ActiveRecord::Migration[5.0]
  def change
    create_table :labtech_timeslips do |t|
      t.string :name
      t.integer :labtime

      t.timestamps
    end
  end
end
