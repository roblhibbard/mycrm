class CreateLabtickets < ActiveRecord::Migration[5.0]
  def change
    create_table :labtickets do |t|
      t.text :subject

      t.timestamps
    end
  end
end
