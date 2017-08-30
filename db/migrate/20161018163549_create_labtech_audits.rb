class CreateLabtechAudits < ActiveRecord::Migration[5.0]
  def change
    create_table :labtech_audits do |t|
      t.integer :labtech_ticket
      t.datetime :date
      t.text :description
      t.string :technician
      t.string :category
      t.decimal :time
      t.integer :cal_ticket
      t.decimal :cal_time
      t.decimal :time_dif
      t.boolean :upadted
      t.boolean :complete
      t.text :details

      t.timestamps
    end
  end
end
