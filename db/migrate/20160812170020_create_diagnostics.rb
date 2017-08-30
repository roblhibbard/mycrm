class CreateDiagnostics < ActiveRecord::Migration[5.0]
  def change
    create_table :diagnostics do |t|
      t.references :ticket, foreign_key: true
      t.boolean :hard_drive
      t.boolean :mem_test
      t.boolean :mobo
      t.integer :dumps
      t.integer :scans
      t.float :temp
      t.integer :chkdsk
      t.integer :policies
      t.text :details

      t.timestamps
    end
  end
end
