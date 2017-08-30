class CreateDispatches < ActiveRecord::Migration[5.0]
  def change
    create_table :dispatches do |t|
      t.string :phone
      t.text :details
      t.integer :ticket
      t.boolean :calendar
      t.integer :billable_time
      t.integer :non_billable

      t.timestamps
    end
  end
end
