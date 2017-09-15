class CreateLabtechDispatches < ActiveRecord::Migration[5.1]
  def change
    create_table :labtech_dispatches do |t|
      t.string :phone
      t.text :subject
      t.references :timeslip_category, foreign_key: true

      t.timestamps
    end
  end
end
