class CreateLabtechDispatches < ActiveRecord::Migration[5.1]
  def change
    create_table :labtech_dispatches do |t|
      t.string :phone
      t.text :subject
      t.datetime :started_date
      t.datetime :update_date
      t.string :requestor_email

      t.timestamps
    end
  end
end
