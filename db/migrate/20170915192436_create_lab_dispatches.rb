class CreateLabDispatches < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_dispatches do |t|
      t.references :labticket, foreign_key: true
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
